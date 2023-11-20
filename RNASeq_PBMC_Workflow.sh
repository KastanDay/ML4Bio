!/bin/bash

# This is a command line executable workflow for RNA-Seq on PBMC Samples

# Quality Control with FastQC
fastqc PBMC_samples.fastq

# Alignment with STAR
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn PBMC_samples.fastq

# Differential Expression Analysis with DESeq2
Rscript DESeq2_analysis.R PBMC_samples