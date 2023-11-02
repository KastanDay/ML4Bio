#!/bin/bash

# Input file
input_file=$1

# Run STAR
STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn $input_file