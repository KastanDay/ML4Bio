#!/bin/bash

# Call the other scripts in the correct order
sh FastQC.sh
sh MultiQC.sh
sh STAR.sh
sh RSEM.sh
sh samtools.sh
Rscript DESeq2.R