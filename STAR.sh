#!/bin/bash

# STAR alignment
STAR --runThreadN 4 --genomeDir /path/to/PBMC_genomeDir --readFilesIn PBMC_file1.fastq.gz PBMC_file2.fastq.gz --readFilesCommand zcat --outFileNamePrefix ./star_output/