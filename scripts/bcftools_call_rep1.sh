#!/bin/bash

# SNV calling using BCFtools
# Sample: SRR25629155 / Ecoli_rep1
# Organism: E. coli, haploid genome

INPUT="../results/raw_1.bcf"
OUTPUT="../results/variants_1.vcf.gz"
SUMMARY="../results/variants_1.txt"

bcftools call \
  --ploidy 1 \
  -m \
  -v \
  -Oz \
  -o "$OUTPUT" \
  "$INPUT"

bcftools index "$OUTPUT"

bcftools view "$OUTPUT" | head -n 10 > "$SUMMARY"