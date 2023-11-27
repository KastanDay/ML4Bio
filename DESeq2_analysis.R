# Load DESeq2 library
library(DESeq2)

# Define directory containing count files
countDirectory <- 'Report_WholeBrain'

# Read in count data
countData <- read.table(paste0(countDirectory, '/counts.txt'), header=TRUE, row.names=1)

# Define condition (assuming two conditions)
condition <- factor(c(rep('cond1', 3), rep('cond2', 3)))

# Create DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData = countData, colData = data.frame(condition), design = ~ condition)

# Run DESeq2 analysis
dds <- DESeq(dds)

# Get results
res <- results(dds)

# Write results to file
write.csv(as.data.frame(res), file='DESeq2_results.csv')