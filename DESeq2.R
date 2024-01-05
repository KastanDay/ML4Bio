# Load DESeq2 library
library(DESeq2)

# Read in count data
countData <- read.csv('rsem_output.genes.results', sep='\t', row.names=1)

# Specify conditions
condition <- factor(c('condition1', 'condition2'))


source('DESeq2_PBMC.R')
# Write results to file

