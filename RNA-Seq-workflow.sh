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
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn file1.fastq.gz file2.fastq.gz --readFilesCommand zcat --outFileNamePrefix star_ --outSAMtype BAM SortedByCoordinate

# Step 4: RSEM quantification
rsem-calculate-expression --paired-end --alignments -p 4 star_Aligned.toTranscriptome.out.bam /path/to/rsem_index_prefix rsem_

# Step 5: Samtools sorting and indexing
samtools sort -@ 4 -o sorted.bam star_Aligned.sortedByCoord.out.bam
samtools index sorted.bam

# Step 6: DESeq2 analysis