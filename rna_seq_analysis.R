# Load necessary libraries
library('DESeq2')
library('ggpubr')

# Define the directory where the data files are located
data_dir <- 'path_to_your_data_directory'

# Read the count data
cts <- read.table(file.path(data_dir, 'counts.txt'), header=TRUE, row.names=1)

# Read the sample information
coldata <- read.table(file.path(data_dir, 'coldata.txt'), header=TRUE, row.names=1)

# Create a DESeqDataSet object
dds <- DESeqDataSetFromMatrix(countData = cts, colData = coldata, design = ~ condition)

# Run the differential expression analysis
dds <- DESeq(dds)

# Get the results
res <- results(dds)

# Plot the results
pdf(file.path(data_dir, 'results.pdf'))
ggplot(res, aes(x=log2FoldChange, y=-log10(pvalue))) + geom_point() + theme_bw()
dev.off()
