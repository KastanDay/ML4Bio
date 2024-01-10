!/bin/bash
#PBS -N fastqc
#PBS -l walltime=04:00:00
#PBS -l nodes=1:ppn=8
#PBS -q batch

module load FastQC/0.11.8

# Directory where raw data is stored
DATA_DIR='/path/to/raw/data'

# Directory to output the FastQC results
OUTPUT_DIR='/path/to/fastqc/results'

# Run FastQC on all files in the data directory
fastqc -o ${OUTPUT_DIR} ${DATA_DIR}/*.fastq.gz

# Generate a MultiQC report
module load MultiQC/1.7
multiqc ${OUTPUT_DIR} -o ${OUTPUT_DIR}