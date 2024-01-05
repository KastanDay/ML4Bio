library(DESeq2)
library(readr)

# Read the input file
input_file <- "Report_WholeBrain/SampleInfo_RUVvariables_WholeBrain_2022-05-12.csv"
data <- read_csv(input_file)

# Prepare the data for DESeq2
dds <- DESeqDataSetFromMatrix(countData = data[,3:5], colData = data[,1:2], design = ~ Sample)

# Run DESeq2
dds <- DESeq(dds)

# Get the results
res <- results(dds)

# Write the results to a CSV file
write.csv(res, "DESeq2_output.csv")
