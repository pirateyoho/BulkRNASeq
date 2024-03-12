#!/bin/bash
# Purpose: Run multiQC to summarize QC files of various packages utilized in this pipeline
# This script should be run in your base project directory

#SBATCH --job-name=execute_multiQC
#SBATCH --nodes=1
#SBATCH --ntasks=4 # modify this number to reflect how many cores you want to use (up to 32); make sure it matches the -t option below.
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --qos=normal
#SBATCH --time=4:00:00 # modify this to reflect how long to let the job go (HH:MM:SS). Max is 24 hours.
#SBATCH --output=log_MultiQC_%J.txt # capture output in a log file
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT # set email alert preferences
#SBATCH --mail-user=eid@colostate.edu  # replace with your email address


# Run multiQC and store output in a new directory called MultiQC
multiqc --outdir ./MultiQC .