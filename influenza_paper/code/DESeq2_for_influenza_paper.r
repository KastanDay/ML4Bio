library(DESeq2)
library(readr)

# Read the featureCounts output file
count_file <- "10C_CTGAAGCT-GTACTGAC_L00M__featCounts.txt"
# Skip the metadata lines and read only the count data. Adjust 'skip' as needed
count_data <- read.table(count_file, header = TRUE, sep = "\t", skip = 1, check.names = FALSE)

# Column names adjustment: change the BAM file column name to something more readable
colnames(count_data)[length(colnames(count_data))] <- "counts"

# You will also need a separate metadata file that includes the sample information and the conditions
# This file should have rows corresponding to the columns of the count_data
# For this example, I'll create a dummy metadata dataframe
# Replace this with reading your actual metadata file
meta_data <- data.frame(
  sampleName = "10C_CTGAAGCT-GTACTGAC_L00M",
  condition = "conditionA" # replace with actual condition names
)

# Prepare the data for DESeq2
dds <- DESeqDataSetFromMatrix(countData = count_data[,7], colData = meta_data, design = ~ condition)

# Run DESeq2
dds <- DESeq(dds)

# Get the results
res <- results(dds)

# Write the results to a CSV file
write.csv(as.data.frame(res), "DESeq2_output.csv")
