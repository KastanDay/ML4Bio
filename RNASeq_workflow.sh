#!/bin/bash

# FastQC
fastqc Report_WholeBrain/*.fastq.gz

# MultiQC
multiqc .

# STAR
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn Report_WholeBrain/*.fastq.gz --readFilesCommand zcat --outFileNamePrefix Report_WholeBrain/STAR/

# RSEM
rsem-calculate-expression --paired-end --alignments -p 4 Report_WholeBrain/STAR/Aligned.toTranscriptome.out.bam /path/to/rsem_ref Report_WholeBrain/RSEM/

# Samtools
samtools sort -@ 4 -o sorted.bam Report_WholeBrain/STAR/Aligned.toTranscriptome.out.bam
samtools index sorted.bam

# DESeq2
Rscript DESeq2.R