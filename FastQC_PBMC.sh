#!/bin/bash

# Import FastQC
module load FastQC

# Define the path to the input file
input_file="Report_WholeBrain/SampleInfo_RUVvariables_WholeBrain_2022-05-12.csv"

# Read the input file and extract the sample names
sample_names=$(cut -d ',' -f 1 $input_file | tail -n +2)

# Loop over the sample names
for sample in $sample_names
do
    # Execute FastQC
    fastqc raw_data/${sample}.fastq -o FastQC_output/
done
