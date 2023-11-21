import os
import subprocess

# Function to run FastQC
def run_fastqc():
    command = 'fastqc *.fastq.gz -o ./fastqc_output/'
    subprocess.run(command, shell=True)

# Placeholder for MultiQC function
def run_multiqc():
    pass

# Placeholder for STAR function
def run_star():
    pass

# Placeholder for RSEM function
def run_rsem():
    pass

# Placeholder for DESeq2 function
def run_deseq2():
    pass

if __name__ == '__main__':
    run_fastqc()
    run_multiqc()
    run_star()
    run_rsem()
    run_deseq2()