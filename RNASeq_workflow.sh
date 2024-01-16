#!/bin/bash

# FastQC
fastqc Report_WholeBrain/*.fastq

# MultiQC
multiqc .

# STAR
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn Report_WholeBrain/*.fastq

# RSEM
rsem-calculate-expression --paired-end --alignments --estimate-rspd --append-names --no-bam-output Report_WholeBrain/*.bam /path/to/reference Report_WholeBrain/RSEM

# samtools
samtools sort Report_WholeBrain/*.bam -o sorted.bam
samtools index sorted.bam

# DESeq2
Rscript DESeq2.R