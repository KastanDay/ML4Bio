#!/bin/bash

# Update system
sudo apt-get update

# Install FastQC
sudo apt-get install -y fastqc

# Install MultiQC
pip install multiqc

# Install STAR
wget https://github.com/alexdobin/STAR/archive/2.7.9a.tar.gz
tar -xzf 2.7.9a.tar.gz

# Install RSEM
wget https://github.com/deweylab/RSEM/archive/v1.3.3.tar.gz
tar -xzf v1.3.3.tar.gz

# Install samtools
sudo apt-get install -y samtools

# Install DESeq2
R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager'); BiocManager::install('DESeq2')"