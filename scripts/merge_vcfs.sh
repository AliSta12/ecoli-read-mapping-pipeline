#!/bin/bash

# Merge VCF files from biological replicates
# Samples:
# SRR25629155 -> variants_1.vcf.gz
# SRR25629154 -> variants_2.vcf.gz
# SRR25629153 -> variants_3.vcf.gz

bcftools merge \
  ../results/variants_1.vcf.gz \
  ../results/variants_2.vcf.gz \
  ../results/variants_3.vcf.gz \
  -Oz \
  -o ../results/merged.vcf.gz

bcftools index ../results/merged.vcf.gz