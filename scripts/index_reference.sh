#!/bin/bash

# Reference genome indexing using BWA
# Reference: Escherichia coli K-12, RefSeq GCF_000005845.2

REFERENCE="../docs/GCF_000005845.2_ASM584v2_genomic.fna"

echo "Indexing reference genome with BWA..."
bwa index "$REFERENCE"

echo "Reference genome indexing completed."