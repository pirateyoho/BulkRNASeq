#!/bin/bash
# Building a STAR index file with STAR genomeGenerate
# Requires genome fasta and gtf files have been obtained from a source like Ensembl or UCSC Genome Browser


#SBATCH --job-name=execute_STAR-build
#SBATCH --nodes=1
#SBATCH --ntasks=8 # modify this number to reflect how many cores you want to use (up to 32)
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --time=4:00:00   # modify this to reflect how long to let the job go (HH:MM:SS). Max is 24 hours.
#SBATCH --qos=normal
#SBATCH --output=log_STAR-build_%J.txt # capture output in a log file
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT # set email alert preferences
#SBATCH --mail-user=eid@colostate.edu # replace with your email address


# make output directory
mkdir STAR_genome_index


# Run STAR ***REPLACE NAMES FOR .fa AND .gtf FILES APPROPRIATELY***
STAR \
--runThreadN 8 \
--runMode genomeGenerate \
--genomeDir ./STAR_genome_index \
--genomeFastaFiles ./Genome.fa \
--sjdbGTFfile ./gtfFile.gtf
