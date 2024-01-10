!/bin/bash

# This is a command line executable workflow for RNA-Seq on PBMC Samples

# Quality control checks on raw sequence data
sh FastQC.sh

# Differential expression analysis
Rscript DESeq2.R

# Main analysis workflow
jupyter nbconvert --execute RNASeq_Analysis.ipynb