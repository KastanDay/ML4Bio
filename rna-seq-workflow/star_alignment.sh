!/bin/bash
#PBS -N star_alignment
#PBS -l walltime=08:00:00
#PBS -l nodes=1:ppn=16
#PBS -q batch

module load STAR/2.7.3a

# Directory where raw data is stored
DATA_DIR='/path/to/raw/data'

# Directory where the STAR index is stored
STAR_INDEX='/path/to/star/index'

# Directory to output the STAR alignment results
OUTPUT_DIR='/path/to/star/results'

# Run STAR for each sample
for sample in ${DATA_DIR}/*.fastq.gz
do
  # Define output directory for the sample
  sample_name=$(basename ${sample} .fastq.gz)
  mkdir -p ${OUTPUT_DIR}/${sample_name}

  # Run STAR alignment
  STAR --runThreadN 16 \
      --genomeDir ${STAR_INDEX} \
      --readFilesIn ${sample} \
      --readFilesCommand zcat \
      --outFileNamePrefix ${OUTPUT_DIR}/${sample_name}/ \
      --outSAMtype BAM SortedByCoordinate

done