!/bin/bash
#PBS -N samtools_processing
#PBS -l walltime=02:00:00
#PBS -l nodes=1:ppn=4
#PBS -q batch

module load samtools/1.9

# Directory where the STAR alignment results are stored
ALIGNMENT_DIR='/path/to/star/results'

# Process BAM files with samtools
for bam in ${ALIGNMENT_DIR}/*/*.bam
do
  # Sort BAM file
  samtools sort -@ 4 -o ${bam%.bam}.sorted.bam ${bam}
  # Index sorted BAM file
  samtools index ${bam%.bam}.sorted.bam
done