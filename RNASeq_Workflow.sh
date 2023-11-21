#!/bin/bash

# This is the main script for the RNA-Seq workflow.
# It will call the individual scripts in the correct order.

# Call the individual scripts in the correct order
./FastQC.sh
./STAR.sh
./samtools.sh
./RSEM.sh
./DESeq2.R
./MultiQC.sh
