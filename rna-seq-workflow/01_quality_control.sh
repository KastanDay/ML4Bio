!/bin/bash
#PBS -N quality_control
#PBS -l walltime=04:00:00
#PBS -l nodes=1:ppn=8
#PBS -q batch

# Load modules for FastQC and MultiQC
module load FastQC/0.11.8
module load MultiQC/1.9

# Define input and output directories
INPUT_DIR='/path/to/raw_data'
OUTPUT_DIR='/path/to/output/quality_control'

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Run FastQC on all files in the input directory
fastqc -o $OUTPUT_DIR -t 8 $INPUT_DIR/*.fastq.gz

# Run MultiQC to aggregate results
multiqc -o $OUTPUT_DIR $OUTPUT_DIR
