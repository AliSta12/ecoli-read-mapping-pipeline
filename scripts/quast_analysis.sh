#!/bin/bash

# QUAST genome assembly quality assessment
# Assembly generated with SPAdes hybrid assembly pipeline

ASSEMBLY="../results/spades_output/contigs.fasta"
OUTPUT_DIR="../results/quast_output"

echo "Running QUAST analysis..."

quast.py \
"$ASSEMBLY" \
-o "$OUTPUT_DIR"

echo "QUAST analysis completed."