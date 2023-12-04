!/bin/bash
#PBS -N sort_index_bam
#PBS -l walltime=02:00:00
#PBS -l nodes=1:ppn=4
#PBS -q batch

# Load module for samtools
module load samtools/1.10

# Define input and output directories
INPUT_DIR='/path/to/alignment'
OUTPUT_DIR='/path/to/output/sorted_bams'

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Sort and index BAM files
for bam in $INPUT_DIR/*.bam
do
  # Define output file names
  sorted_bam=$OUTPUT_DIR/$(basename $bam .bam).sorted.bam

  # Sort BAM file
  samtools sort -@ 4 -o $sorted_bam $bam

  # Index sorted BAM file
  samtools index $sorted_bam
done
