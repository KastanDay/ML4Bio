!/bin/bash

# Quality Control with FastQC
fastqc *.fastq.gz

# Alignment with STAR
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn /path/to/read1.fastq.gz /path/to/read2.fastq.gz --readFilesCommand zcat --outFileNamePrefix output

# Quantification with RSEM
rsem-calculate-expression --paired-end --alignments -p 4 outputAligned.toTranscriptome.out.bam /path/to/rsem_reference output

# Differential Expression Analysis with DESeq2
Rscript DESeq2_analysis.R