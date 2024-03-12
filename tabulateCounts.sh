#!/bin/bash
# Purpose: Run featureCounts on bam files. Should be done after STAR. Output will be .txt file of tabulated read counts. 
# This script should be run from the 03_output directory containing .bam files

#SBATCH --nodes=1
#SBATCH --ntasks=4 # modify this number to reflect how many cores you want to use (up to 32). Make sure this matches the -T command below.
#SBATCH --time=12:00:00  # modify this to reflect how long to let the job go (HH:MM:SS). Max is 24 hours.
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --output=tabulate-%j.out # capture output in a log file
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT # set email alert preferences
#SBATCH --mail-user=eid@colostate.edu # replace with your email address

# Run featureCounts. Replace BAMfile1 BAMfile2 BAMfile3 with a space-delimited list of .bam file names
featureCounts -p -T 4 -a ../../indicesBuild/path-to-genome-gtf-file.gtf -o ../FileName_feature_counts.txt BAMfile1 BAMfile2 BAMfile3
