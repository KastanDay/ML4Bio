library(DESeq2)

# Step 1: Generate file paths
file_paths <- list.files(path = "../data/raw_feat_counts", pattern = "_featCounts.txt", full.names = TRUE)

# Function to read count data from a single file
read_featureCounts <- function(file_path) {
    counts <- read.table(file_path, header = TRUE, skip = 1, check.names = FALSE)
    return(counts[,ncol(counts)])  # assuming count data is in the last column
}

# Step 2: Read and combine count data
all_counts <- sapply(file_paths, read_featureCounts)
row.names(all_counts) <- read.table(file_paths[1], header = TRUE, skip = 1, check.names = FALSE)$Geneid

# Step 3: Create metadata
# Extract sample names from file names
sample_names <- gsub(pattern = "(.*)_featCounts\\.txt", replacement = "\\1", basename(file_paths))
# You need to provide the conditions for each sample
conditions <- rep(c("Control", "Treatment"), length.out = length(sample_names))
meta_data <- data.frame(sampleName = sample_names, condition = conditions)

# Step 4: Run DESeq2 analysis
dds <- DESeqDataSetFromMatrix(countData = all_counts, colData = meta_data, design = ~ condition)
dds <- DESeq(dds)

# Get the results
res <- results(dds)

# Write the results to a CSV file
write.csv(as.data.frame(res), "DESeq2_output.csv")
