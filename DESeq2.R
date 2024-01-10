# Load DESeq2 library
library(DESeq2)

# Read in count data
countData <- read.csv('rsem_output.genes.results', sep='\t', row.names=1)

# Specify conditions
condition <- factor(c('PBMC_condition1', 'PBMC_condition2'))

# Create DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData = countData, colData = data.frame(condition), design = ~ condition)

# Run DESeq
dds <- DESeq(dds)

# Get results
res <- results(dds)

# Write results to file
write.csv(as.data.frame(res), file='DESeq2_results.csv')