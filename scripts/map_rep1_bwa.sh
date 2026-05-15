#!/bin/bash

# Mapping paired-end trimmed reads to the E. coli K-12 reference genome using BWA-MEM
# Sample: SRR25629155
# Input FASTQ files are not included in the repository.

REFERENCE="../reference/ecoli_k12_refseq.fasta"

READ1="/path/to/SRR25629155_1_trimmed.fastq.gz"
READ2="/path/to/SRR25629155_2_trimmed.fastq.gz"

OUTPUT="../results/Ecoli_rep1.sam"

echo "Mapping SRR25629155 paired-end reads with BWA-MEM..."

bwa mem "$REFERENCE" "$READ1" "$READ2" > "$OUTPUT"

echo "Mapping completed. Output saved as Ecoli_rep1.sam"