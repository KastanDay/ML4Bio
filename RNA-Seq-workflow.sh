#!/bin/bash

# This script performs RNA-Seq analysis on PBMC Samples.

# Step 1: FastQC analysis
for filename in *.fastq.gz
do
  fastqc $filename
done

# Step 2: MultiQC analysis
multiqc .

# Step 3: STAR alignment
# Step 4: RSEM quantification
# Step 5: Samtools sorting and indexing
# Step 6: DESeq2 analysis