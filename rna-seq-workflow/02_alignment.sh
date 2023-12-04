!/bin/bash
#PBS -N alignment
#PBS -l walltime=08:00:00
#PBS -l nodes=1:ppn=16
#PBS -q batch

# Load module for STAR
module load STAR/2.7.3a

# Define input and output directories
INPUT_DIR='/path/to/quality_control'
OUTPUT_DIR='/path/to/output/alignment'
GENOME_DIR='/path/to/genome_indices'

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Run STAR for each sample
for sample in $INPUT_DIR/*.fastq.gz
do
  # Define output file names
  prefix=$(basename $sample .fastq.gz)
  output_prefix=$OUTPUT_DIR/$prefix

  # Run STAR
  STAR --runThreadN 16 --genomeDir $GENOME_DIR --readFilesIn $sample --readFilesCommand zcat --outFileNamePrefix $output_prefix --outSAMtype BAM SortedByCoordinate

done
