!/bin/bash

# STAR alignment
./STAR --runThreadN 4 --genomeDir /path/to/genomeDir --readFilesIn /path/to/read1.fastq /path/to/read2.fastq --outFileNamePrefix ./star_output/

# RSEM quantification
./RSEM.sh