#!/bin/bash
# Purpose: to execute fastp on two paired-end reads of fastq files

#SBATCH --job-name=execute_fastp
#SBATCH --nodes=1
#SBATCH --ntasks=16 # modify this number to reflect how many cores you want to use (FYI, the max fastp can utilize is 16 threads)
#SBATCH --partition=amilan # Alpine’s general compute node
#SBATCH --qos=normal # If you need more than 24 hours, you can change this to qos=long
#SBATCH --time=23:00:00 # modify this to reflect how long to let the job go (HH:MM:SS). Max is 24 hours.
#SBATCH --output=log_fastp_%J.txt # capture output in a log file
#SBATCH --mail-type=BEGIN,END,FAIL,TIME_LIMIT # set email alert preferences
#SBATCH --mail-user=eid@colostate.edu # replace with your email address

## IMPORTANT!!!! This script assumes your input files are in the format SAMPLE1_1.fq.gz for the first read and SAMPLE1_2.fq.gz for the second read. If your filename convention is different, you will need to modify this script accordingly.

# Initiate a bash array called SAMPLEIDs.
SAMPLEIDs="SAMPLE1 SAMPLE2 SAMPLE3 etc" # Space delimited list of Sample IDs in quotation marks; ***need to match the sample ID in the fastq filename.***
 
# Loop through the SAMPLEID array and run fastp on each. ***MODIFY FILENAMES AS NECESSARY***
for SAMPLEID in $SAMPLEIDs
do
     fastp -i ../01_input/${SAMPLEID}_1.fq.gz\
     -I ../01_input/${SAMPLEID}_2.fq.gz\
     -o ../03_output/${SAMPLEID}_trim_1.fq\
     -O ../03_output/${SAMPLEID}_trim_2.fq\
     -h ../03_output/${SAMPLEID}_report.html\
     -j ../03_output/${SAMPLEID}_report.json\
     --detect_adapter_for_pe\
     --thread 16\
     -g -x -p
done