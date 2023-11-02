# Load DESeq2 library
library(DESeq2)

# Define count matrix and design matrix
# countData <- read.table('count_matrix.txt', header = TRUE, row.names = 1)
# colData <- read.table('design_matrix.txt', header = TRUE, row.names = 1)

# Create DESeqDataSet
# dds <- DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~ condition)

# Run DESeq
# dds <- DESeq(dds)

# Get results
# res <- results(dds)