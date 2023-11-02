#!/bin/bash

# Input directory
dir=$1

# Run FastQC
bash fastqc.sh $dir

# Run MultiQC
bash multiqc.sh $dir

# Run STAR
bash star.sh $dir

# Run RSEM
bash rsem.sh $dir

# Run samtools
bash samtools.sh $dir

# Run DESeq2
Rscript deseq2.R $dir