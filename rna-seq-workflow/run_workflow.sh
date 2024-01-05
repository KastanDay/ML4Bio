!/bin/bash
# Master script to run the RNA-Seq workflow

# Run quality control
bash 01_quality_control.sh

# Run alignment
bash 02_alignment.sh

# Run transcript quantification
bash 03_transcript_quantification.sh

# Sort and index BAM files
bash 04_sort_index_bam.sh

# Run differential expression analysis
Rscript 05_differential_expression.R

# Workflow completed
echo "RNA-Seq workflow completed successfully."
