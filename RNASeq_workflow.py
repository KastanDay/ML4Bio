# This is the main script for the RNA-Seq workflow

# Execute FastQC
sh FastQC.sh

# Execute MultiQC
sh MultiQC.sh

# Execute STAR
sh STAR.sh

# Execute RSEM
sh RSEM.sh

# Execute DESeq2
Rscript DESeq2.R