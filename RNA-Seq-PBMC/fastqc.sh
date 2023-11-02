!/bin/bash
# FastQC script

# Input directory
input_dir=$1

# Output directory
output_dir=$2

# Create output directory if it doesn't exist
mkdir -p $output_dir

# Run FastQC on all files in the input directory
for file in $input_dir/*.fastq.gz
do
  fastqc $file -o $output_dir
done