#!/bin/bash

# Samtools sorting and indexing
samtools sort ./star_output/Aligned.out.bam -o sorted.bam
samtools index sorted.bam