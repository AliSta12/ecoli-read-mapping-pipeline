#!/bin/bash

# PCR duplicate removal workflow using Samtools
# Sample: SRR25629155 / Ecoli_rep1

INPUT_BAM="../results/Ecoli_rep1.bam"

echo "Fixing mate information..."
samtools fixmate -m \
"$INPUT_BAM" \
../results/Ecoli_rep1_fixmate.bam

echo "Sorting BAM file..."
samtools sort \
../results/Ecoli_rep1_fixmate.bam \
-o ../results/Ecoli_rep1_fixmate_sorted.bam

echo "Indexing sorted BAM..."
samtools index \
../results/Ecoli_rep1_fixmate_sorted.bam

echo "Removing PCR duplicates..."
samtools markdup -r \
../results/Ecoli_rep1_fixmate_sorted.bam \
../results/Ecoli_rep1_dedup.bam

echo "Duplicate removal completed."