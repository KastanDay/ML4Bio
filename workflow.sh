#!/bin/bash

# RNA-Seq workflow for PBMC Samples

# Step 1: FastQC
fastqc -o fastqc_results/ *.fastq

# Step 2: MultiQC
multiqc -o multiqc_results/ fastqc_results/

# Step 3: STAR
STAR --genomeDir star_index/ --readFilesIn *.fastq --runThreadN 8 --outFileNamePrefix star_results/

# Step 4: RSEM
rsem-calculate-expression --paired-end --num-threads 8 --star --star-path star_index/ --output-genome-bam --output-genome-bam-prefix rsem_results/ *.fastq

# Step 5: samtools
samtools sort -o rsem_results/sorted.bam rsem_results/genome.bam

# Step 6: DESeq2
Rscript deseq2.R