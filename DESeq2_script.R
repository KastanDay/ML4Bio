# Load the DESeq2 library
library(DESeq2)

# Read in the count data
countData <- read.csv('counts.csv', header = TRUE, row.names = 1)

# Read in the metadata
colData <- read.csv('metadata.csv', header = TRUE, row.names = 1)

# Create a DESeqDataSet object
dds <- DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~ condition)

# Run the differential expression analysis
dds <- DESeq(dds)

# Get the results
res <- results(dds)

# Write the results to a file
write.csv(as.data.frame(res), file = 'DESeq2_results.csv')