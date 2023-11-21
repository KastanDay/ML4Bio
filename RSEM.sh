#!/bin/bash

# RSEM quantification
rsem-calculate-expression --paired-end --alignments -p 4 ./star_output/Aligned.toTranscriptome.out.bam /path/to/PBMC_reference ./rsem_output/