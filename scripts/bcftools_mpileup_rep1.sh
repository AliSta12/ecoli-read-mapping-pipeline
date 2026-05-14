#!/bin/bash

# BCFtools mpileup
# Sample: SRR25629155 / Ecoli_rep1
# Goal: coverage estimation and genotype likelihood generation

REFERENCE="../docs/GCF_000005845.2_ASM584v2_genomic.fna"
BAM="../results/Ecoli_rep1_dedup.bam"
OUTPUT="../results/raw_1.bcf"

bcftools mpileup \
  -O b \
  -o "$OUTPUT" \
  -f "$REFERENCE" \
  -q 20 \
  -Q 30 \
  "$BAM"