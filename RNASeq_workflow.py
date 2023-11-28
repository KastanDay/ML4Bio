# This is the main script that will execute the other scripts in the correct order
import subprocess

# Execute FastQC.sh
subprocess.call(['./FastQC.sh'])

# Execute MultiQC.sh
subprocess.call(['./MultiQC.sh'])

# Execute STAR.sh
subprocess.call(['./STAR.sh'])

# Execute RSEM.sh
subprocess.call(['./RSEM.sh'])

# Execute DESeq2.R
subprocess.call(['Rscript', './DESeq2.R'])