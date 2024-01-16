# Load DESeq2 library
library(DESeq2)

# Define directory containing count files
countDirectory <- 'Report_WholeBrain'

# Read in count files
countFiles <- list.files(countDirectory, pattern='*.counts', full.names=TRUE)

# Read in the first count file to get the list of genes
firstCountFile <- read.table(countFiles[1], header=TRUE, row.names=1)
genes <- rownames(firstCountFile)

# Initialize a matrix to hold the counts for all samples
allCounts <- matrix(nrow=length(genes), ncol=length(countFiles), dimnames=list(genes, countFiles))

# Read in the counts for each sample
for (i in 1:length(countFiles)) {
  counts <- read.table(countFiles[i], header=TRUE, row.names=1)
  allCounts[,i] <- counts[,1]
}

# Define the condition for each sample
condition <- factor(c(rep('condition1', 3), rep('condition2', 3)))

# Create a DESeqDataSet
dds <- DESeqDataSetFromMatrix(countData=allCounts, colData=data.frame(condition), design=~condition)

# Run the differential expression analysis
dds <- DESeq(dds)

# Get the results
res <- results(dds)

# Write the results to a file
write.table(res, file='DESeq2_results.txt', sep='\t', quote=FALSE)