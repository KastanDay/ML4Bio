!/bin/bash

# This is a command line executable workflow for RNA-Seq on PBMC Samples

# Quality control checks on raw sequence data
./FastQC.sh

# Differential gene expression analysis
Rscript DESeq2.R

# Further analysis steps
jupyter nbconvert --execute RNASeq_Analysis.ipynb