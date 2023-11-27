# DESeq2 R Script

# Load libraries
library(DESeq2)

# Read in data
data <- read.csv("data.csv")

# Run DESeq2
dds <- DESeqDataSetFromMatrix(countData = data, colData = sample_info, design = ~ condition)
dds <- DESeq(dds)

# Get results
res <- results(dds)

# Write results to file
write.csv(res, "deseq2_results.csv")