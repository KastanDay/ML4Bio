#!/bin/bash

# STAR alignment
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn file1.fastq.gz file2.fastq.gz --readFilesCommand zcat --outFileNamePrefix ./star_output/