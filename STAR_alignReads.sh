#!/bin/bash
# Running alignment job with STAR
# This should be done after fastp and STAR genomeGenerate

#SBATCH --job-name=execute_STAR-mapping
#SBATCH --nodes=1
#SBATCH --ntasks=16 # modify this number to reflect how many cores you want to use (up to 32), and update the --runThreadN command below to match
#SBATCH --partition=amilan
#SBATCH --qos=normal
#SBATCH --time=23:00:00
#SBATCH --output=log_STAR-mapping_%J.txt
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT
#SBATCH --mail-user=eid@colostate.edu


#Make an output directory for results:
mkdir ../03_output/STAR_Alignment_to_GenomeName

# Create an array of sample IDs for looping.
SampleIDs="CI100641 CI100850 CI100993 … etc." # Space delimited list of sample IDs in quotation marks.


# Run STAR, looping through each sample. Adjust pathways as needed.


for SampleID in $SampleIDs
do
STAR \
--runThreadN 16 \
--genomeDir ../indicesBuild/directory-containing-STAR-generated-genome-index-files\
--quantMode GeneCounts \
--outSAMtype BAM SortedByCoordinate \
--outReadsUnmapped Fastx \
--sjdbGTFfile ../indicesBuild/path-to-reference-genome-GTF-file \
--readFilesIn ../03_output/${SampleID}_trim_1.fq ../03_output/${SampleID}_trim_2.fq \
--outFileNamePrefix ../03_output/STAR_Alignment_to_GenomeName/${SampleID}
done