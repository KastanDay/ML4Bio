!/bin/bash
# MultiQC script

# Input directory
input_dir=$1

# Output directory
output_dir=$2

# Create output directory if it doesn't exist
mkdir -p $output_dir

# Run MultiQC
multiqc $input_dir -o $output_dir