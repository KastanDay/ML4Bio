!/bin/bash
#PBS -N rsem_quantification
#PBS -l walltime=12:00:00
#PBS -l nodes=1:ppn=8
#PBS -q batch

module load RSEM/1.3.1

# Directory where the STAR alignment results are stored
ALIGNMENT_DIR='/path/to/star/results'

# Directory where the RSEM reference is stored
RSEM_REF='/path/to/rsem/ref'

# Directory to output the RSEM quantification results
OUTPUT_DIR='/path/to/rsem/results'

# Run RSEM for each sample
for bam in ${ALIGNMENT_DIR}/*/*.bam
do
  # Define output directory for the sample
  sample_name=$(basename $(dirname ${bam}))
  mkdir -p ${OUTPUT_DIR}/${sample_name}

  # Run RSEM quantification
  rsem-calculate-expression --bam --no-bam-output --estimate-rspd \
      --append-names --output-genome-bam \
      -p 8 \
      ${bam} \
      ${RSEM_REF} \
      ${OUTPUT_DIR}/${sample_name}/${sample_name}
done