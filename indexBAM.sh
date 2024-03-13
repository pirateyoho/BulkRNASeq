#!/bin/bash
# Purpose: Indexes a coordinate-sorted BAM file for fast random access. Use the coordinate-sorted BAM files generated by STAR as input. Output will be indexed BAI files. BAI files act as an external “table of contents” for the BAM file and allows programs to jump directly to specific parts of the BAM file without reading through all of the sequences.

#SBATCH --job-name=indexBAM
#SBATCH --nodes=1
#SBATCH --ntasks=4 # modify this number to reflect how many cores you want to use (up to 32)
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --time=1:00:00   # modify this to reflect how long to let the job go (HH:MM:SS). Max is 24 hours.
#SBATCH --qos=normal
#SBATCH --output=log_indexBAM_%J.txt # capture output in a log file
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT # set email alert preferences
#SBATCH --mail-user=eid@colostate.edu # replace with your email address

# Run this script in the directory containing bam files following STAR alignment
$ for bam in $(ls *.bam); do samtools index $bam; done