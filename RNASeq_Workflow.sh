#!/bin/bash

# This is the main script for the RNA-Seq workflow.
# It will call the individual scripts in the correct order.

# Define input parameters
input_dir=INPUT_DIR

# Call the individual scripts in the correct order with the input parameters
./FastQC.sh $input_dir
./STAR.sh $input_dir
./samtools.sh $input_dir
./RSEM.sh $input_dir
./DESeq2.R $input_dir
./MultiQC.sh $input_dir
