#!/bin/bash

# Multi-sample variant calling using BCFtools
# Samples:
# SRR25629154 -> variants_2.vcf.gz
# SRR25629153 -> variants_3.vcf.gz

REFERENCE="../reference/ecoli_k12_refseq.fasta"

bcftools mpileup \
  -O b \
  -o ../results/raw_2.bcf \
  -f "$REFERENCE" \
  -q 20 \
  -Q 30 \
  ../results/SRR25629154_dedup.bam

bcftools call \
  --ploidy 1 \
  -m \
  -v \
  -Oz \
  -o ../results/variants_2.vcf.gz \
  ../results/raw_2.bcf

bcftools index ../results/variants_2.vcf.gz

bcftools mpileup \
  -O b \
  -o ../results/raw_3.bcf \
  -f "$REFERENCE" \
  -q 20 \
  -Q 30 \
  ../results/SRR25629153_dedup.bam

bcftools call \
  --ploidy 1 \
  -m \
  -v \
  -Oz \
  -o ../results/variants_3.vcf.gz \
  ../results/raw_3.bcf

bcftools index ../results/variants_3.vcf.gz