#!/bin/bash

# Import RSEM
module load RSEM

# Define the path to the input file
input_file="Report_WholeBrain/SampleInfo_RUVvariables_WholeBrain_2022-05-12.csv"

# Read the input file and extract the sample names
sample_names=$(cut -d ',' -f 1 $input_file | tail -n +2)

# Loop over the sample names
for sample in $sample_names
do
    # Execute RSEM
    rsem-calculate-expression --paired-end --star STAR_output/${sample}_Aligned.toTranscriptome.out.bam RSEM_output/${sample}
done

# Generate a data matrix from the RSEM results
rsem-generate-data-matrix RSEM_output/* > RSEM_output/data_matrix.txt
