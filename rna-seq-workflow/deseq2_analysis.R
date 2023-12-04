 Load DESeq2 library
library(DESeq2)

# Load the count data and the sample information
# Replace 'countData.csv' and 'colData.csv' with the actual file names
countData <- read.csv('countData.csv', row.names=1)
colData <- read.csv('colData.csv', row.names=1)

# Create a DESeqDataSet object
dds <- DESeqDataSetFromMatrix(countData = countData,
                              colData = colData,
                              design = ~ condition)

# Run the differential expression analysis
dds <- DESeq(dds)

# Get the results
res <- results(dds)

# Order the results by the adjusted p-value
resOrdered <- res[order(res$padj),]

# Write the results to a CSV file
write.csv(as.data.frame(resOrdered), file='deseq2_results.csv')