#!/bin/bash
# Purpose: Run fastQC on multiple fastq files.
# This script should be run in a directory containing raw or trimmed fastq files

#SBATCH --job-name=execute_fastQC
#SBATCH --nodes=1
#SBATCH --ntasks=16 # modify this number to reflect how many cores you want to use (up to 32); make sure it matches the -t option below.
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --qos=normal
#SBATCH --time=4:00:00 # modify this to reflect how long to let the job go (HH:MM:SS). Max is 24 hours.
#SBATCH --output=log_FastQC_%J.txt # capture output in a log file
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT # set email alert preferences
#SBATCH --mail-user=eid@colostate.edu  # replace with your email address


# Run fastQC on all .fq files in the current directory. If running on raw fq.gz files, replace *.fq with *.fq.gz
fastqc -t 16 *.fq
