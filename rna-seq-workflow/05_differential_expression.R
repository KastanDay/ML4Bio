 Load DESeq2 library
library(DESeq2)

# Set input directory
input_dir <- '/path/to/transcript_quantification'

# Read in the count matrix and the sample information
# Assuming countData is a matrix with count data and colData is a DataFrame with sample information
countData <- as.matrix(read.csv(file.path(input_dir, 'count_matrix.csv'), row.names=1))
colData <- read.csv(file.path(input_dir, 'colData.csv'))

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
write.csv(as.data.frame(resOrdered), file.path(input_dir, 'differential_expression_results.csv'))
