!/bin/bash
#PBS -N transcript_quantification
#PBS -l walltime=12:00:00
#PBS -l nodes=1:ppn=8
#PBS -q batch

# Load module for RSEM
module load RSEM/1.3.3

# Define input and output directories
INPUT_DIR='/path/to/alignment'
OUTPUT_DIR='/path/to/output/transcript_quantification'
REFERENCE_DIR='/path/to/reference'

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Run RSEM for each sample
for bam in $INPUT_DIR/*.bam
do
  # Define output file names
  prefix=$(basename $bam .bam)
  output_prefix=$OUTPUT_DIR/$prefix

  # Run RSEM
  rsem-calculate-expression --bam --no-bam-output --estimate-rspd --append-names --output-genome-bam -p 8 $bam $REFERENCE_DIR $output_prefix

done
