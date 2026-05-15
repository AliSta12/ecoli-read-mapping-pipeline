#!/bin/bash

# Reference genome indexing using BWA
# Reference: Escherichia coli K-12, RefSeq GCF_000005845.2

REFERENCE="../reference/ecoli_k12_refseq.fasta"

echo "Indexing reference genome with BWA..."
bwa index "$REFERENCE"

echo "Reference genome indexing completed."