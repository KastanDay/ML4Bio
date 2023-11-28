# This is the main script that will execute the other scripts in the correct order
# Import necessary libraries
import subprocess

# Define the scripts to be executed
scripts = ["FastQC.sh", "MultiQC.sh", "STAR.sh", "RSEM.sh", "DESeq2.R"]

# Execute each script in order
for script in scripts:
    subprocess.call(["sh", script])
    
# End of script