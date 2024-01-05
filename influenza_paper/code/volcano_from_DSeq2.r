# Load the ggplot2 library for plotting
library(ggplot2)

# Read in the DESeq2 results from a CSV file
results <- read.csv("DESeq2_output.csv", row.names = 1)

# Remove NA values for plotting
results <- na.omit(results)

# Create the volcano plot
ggplot(results, aes(x = log2FoldChange, y = -log10(pvalue))) +
  geom_point(aes(col = padj < 0.05), alpha = 0.5) +  # Color points based on adjusted p-value threshold
  scale_color_manual(values = c("TRUE" = "red", "FALSE" = "black")) +  # Red for significant, black for not
  labs(title = "Volcano plot of DESeq2 results",
       x = "Log2 Fold Change",
       y = "-Log10 P-value") +
  theme_minimal() +
  theme(legend.position = "none")  # Remove the legend if not necessary

# Save the plot to a file
ggsave("volcano_plot.png", width = 10, height = 8, dpi = 300)
