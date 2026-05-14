#!/bin/bash

# Multi-sample mapping and BAM processing pipeline
# Samples: SRR25629154, SRR25629153
# Tools: BWA, Samtools
# Input FASTQ files are not included in the repository.

REF_GENOME="../docs/GCF_000005845.2_ASM584v2_genomic.fna"

samples=("SRR25629154" "SRR25629153")

for sample in "${samples[@]}"
do
    echo "Processing sample: ${sample}"

    # Mapping paired-end reads with BWA-MEM
    bwa mem "$REF_GENOME" \
    ${sample}_1_trimmed.fastq.gz \
    ${sample}_2_trimmed.fastq.gz | \
    samtools view -b -o ${sample}.bam

    # Sorting BAM file by read name
    samtools sort -n \
    ${sample}.bam \
    -o ${sample}_namesort.bam

    # Fixing mate-pair information
    samtools fixmate -m \
    ${sample}_namesort.bam \
    ${sample}_fixmate.bam

    # Coordinate sorting
    samtools sort \
    ${sample}_fixmate.bam \
    -o ${sample}_fixmate_sorted.bam

    # BAM indexing
    samtools index \
    ${sample}_fixmate_sorted.bam

    # PCR duplicate removal
    samtools markdup -r \
    ${sample}_fixmate_sorted.bam \
    ${sample}_dedup.bam

    echo "Finished sample: ${sample}"
    echo "-----------------------------"

done

echo "All samples processed successfully."