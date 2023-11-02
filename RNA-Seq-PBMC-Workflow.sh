!/bin/bash

# FastQC
fastqc *.fastq.gz

# MultiQC
multiqc .

# STAR
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn /path/to/read1.fastq.gz /path/to/read2.fastq.gz --readFilesCommand zcat --outFileNamePrefix /path/to/output

# RSEM
rsem-calculate-expression --paired-end --alignments -p 4 /path/to/read1.fastq.gz /path/to/read2.fastq.gz /path/to/reference /path/to/output

# samtools
samtools sort -@ 4 -o sorted.bam /path/to/input.bam
samtools index sorted.bam

# DESeq2
# This will be done in an R script