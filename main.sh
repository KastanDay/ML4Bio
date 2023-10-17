#!/bin/bash

# Execute the entire workflow
bash FastQC.sh
bash MultiQC.sh
bash STAR.sh
bash RSEM.sh
bash samtools.sh
Rscript DESeq2.R