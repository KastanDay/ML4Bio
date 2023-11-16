#!/bin/bash

# Run FastQC
fastqc PBMC_samples.fastq

# Run MultiQC
multiqc .

# Run STAR
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn PBMC_samples.fastq

# Run RSEM
rsem-calculate-expression --paired-end --alignments --estimate-rspd --append-names --no-bam-output PBMC_samples.fastq /path/to/reference/PBMC_samples

# Run Samtools
samtools sort -o sorted_PBMC_samples.bam PBMC_samples.bam

# Run DESeq2
Rscript /path/to/DESeq2_script.R