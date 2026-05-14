#!/bin/bash

# Hybrid de novo genome assembly using SPAdes
# Short reads: Illumina paired-end SRR25629155
# Long reads: Oxford Nanopore SRR25637824
# Organism: Escherichia coli K-12
# Input sequencing files are not included in the repository.

READ1="/path/to/SRR25629155_1_trimmed.fastq.gz"
READ2="/path/to/SRR25629155_2_trimmed.fastq.gz"
NANOPORE="/path/to/SRR25637824.fastq.gz"

OUTPUT_DIR="../results/spades_output"

echo "Running hybrid assembly with SPAdes..."

spades.py \
  -1 "$READ1" \
  -2 "$READ2" \
  --nanopore "$NANOPORE" \
  --careful \
  -o "$OUTPUT_DIR"

echo "Hybrid assembly completed."