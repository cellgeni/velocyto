#!/bin/bash

## conda activate velocyto

TAG=$1
GTF=/nfs/cellgeni/STAR/human/2020A/GRCh38_v32_filtered.gtf
RMSK=/nfs/cellgeni/velocyto/GRCh38_rmsk.gtf

#velocyto run10x -m $RMSK -t uint32 --samtools-threads 16 --samtools-memory 8000 $DIR $GTF
#velocyto run10x -t uint32 --samtools-threads 16 --samtools-memory 8000 $DIR $GTF

velocyto run -t uint32 --samtools-threads 16 --samtools-memory 7000 -b $TAG.barcodes.tsv -o $TAG.velocyto -m $RMSK $TAG.bam $GTF
