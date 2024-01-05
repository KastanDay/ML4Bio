#!/bin/bash

# Import samtools
module load samtools

# Define the path to the input file
input_file="Report_WholeBrain/SampleInfo_RUVvariables_WholeBrain_2022-05-12.csv"

# Read the input file and extract the sample names
sample_names=$(cut -d ',' -f 1 $input_file | tail -n +2)

# Loop over the sample names
for sample in $sample_names
do
    # Execute samtools
    samtools view -b STAR_output/${sample}_Aligned.toTranscriptome.out.bam > samtools_output/${sample}.bam
done
