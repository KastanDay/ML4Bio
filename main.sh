#!/bin/bash

# Execute the entire workflow
bash FastQC_PBMC.sh
bash MultiQC_PBMC.sh
bash STAR_PBMC.sh
bash RSEM_PBMC.sh
bash samtools_PBMC.sh
Rscript DESeq2_PBMC.R