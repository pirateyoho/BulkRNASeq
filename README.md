# BulkRNASeq
## Purpose
This repository contains various bash scripts and R Markdown files for a bulk RNA-sequencing pipeline. 
## Input data
Raw bulk RNA-sequencing files in the fastq format, a fasta file cotaining the nucleotide sequence of your reference genome, and a gtf annotation file for that reference genome.
## Software requirements
Bash scripts (.sh) in this pipeline are intended to be run on the CURC Alpine supercomputer in a dedicated conda environment containing the software packages sra-tools, fastp, bedtools, samtools, star, fastqc, and multiqc. R Markdown documents are intended to be run in R Studio.
## Directory structure
Many of these scripts assume the following subdirectories within your project directory,
```
01_input
02_scripts
03_output
indicesBuild
```
where 01_input contains your raw fastq sequencing files, 02_scripts contains scripts to be executed, 03_output for storage of the output of these scripts, and indicesBuild, which contains fasta and .gtf files for your reference genome.
If your project directory structure is different, paths to files will need to be adjusted prior to running these scripts.
## Pipeline
Scripts should be run in the following order:
1. fastp.sh
2. STAR_buildIndices.sh
3. STAR_alignReads.sh
4. tabulateCounts.sh
5. fastQC.sh
6. multiQC.sh
7. Bioconductor Package Install.Rmd
8. 2023-RNAseq-Analysis.Rmd
9. Various downstream analyses in R (optional, and may be run in any order): clusterProfiler, hierarchical clustering, GSEA, GSVA, etc.
