import os
import subprocess

# Function to run FastQC
def run_fastqc():
    command = 'fastqc *.fastq.gz -o ./fastqc_output/'
    subprocess.run(command, shell=True)

# Function to run MultiQC
def run_multiqc():
    command = 'multiqc ./fastqc_output/ -o ./multiqc_output/'
    subprocess.run(command, shell=True)

# Function to run STAR
def run_star():
    command = 'STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn file1.fastq.gz file2.fastq.gz --readFilesCommand zcat --outFileNamePrefix ./star_output/'
    subprocess.run(command, shell=True)

# Function to run RSEM
def run_rsem():
    command = 'rsem-calculate-expression --paired-end --alignments -p 4 ./star_output/Aligned.toTranscriptome.out.bam /path/to/reference ./rsem_output/'
    subprocess.run(command, shell=True)

# Function to run DESeq2
def run_deseq2():
    command = 'Rscript DESeq2.R'
    subprocess.run(command, shell=True)

if __name__ == '__main__':
    run_fastqc()
    run_multiqc()
    run_star()
    run_rsem()
    run_deseq2()