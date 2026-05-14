#!/bin/bash

# SAM to BAM conversion and coordinate sorting using Samtools
# Sample: SRR25629155 / Ecoli_rep1

INPUT_SAM="../results/Ecoli_rep1.sam"

echo "Converting SAM to BAM..."
samtools view -bS "$INPUT_SAM" > ../results/Ecoli_rep1.bam

echo "Sorting BAM file by coordinate..."
samtools sort ../results/Ecoli_rep1.bam -o ../results/Ecoli_rep1_sorted.bam

echo "Indexing sorted BAM..."
samtools index ../results/Ecoli_rep1_sorted.bam

echo "Generating BAM preview..."
samtools view ../results/Ecoli_rep1_sorted.bam | head > ../results/BAM.txt

echo "SAMtools processing completed."