#!/bin/bash

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

im=/nfs/cellgeni/singularity/images/velocyto_v0.17.17.sif #velocyto image

TAG=$1 #sampleID
GTF=/nfs/cellgeni/STAR/human/2020A/GRCh38_v32_filtered.gtf #gtf file to use
RMSK=/nfs/cellgeni/velocyto/GRCh38_rmsk.gtf #mask file to use
MEM=7000 #GB of memory to use
THREADS=16 #number of threads to use

###################### DONT CHANGE OPTIONS BELOW THIS LINE ###########################

singularity exec -B /lustre -B /nfs/ $im \
  velocyto run -t uint32 --samtools-threads $THREADS --samtools-memory $MEM -b $TAG.barcodes.tsv -o $TAG.velocyto -m $RMSK $TAG.bam $GTF
