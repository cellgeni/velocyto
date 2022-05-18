#!/bin/bash

set -euo pipefail

#run this from data directory

sf=../example-data/irods.txt #tab separated file containing sampleIDs and corresponding irods path to directory
barcode_path=filtered_feature_bc_matrix/barcodes.tsv.gz #path to filtered barcodes file within irods directory
bam_file=possorted_bam.bam #name of bam file within irods directory
index_file=possorted_bam.bam.bai #name of index file within irods directory

###################### DONT CHANGE OPTIONS BELOW THIS LINE ###########################

cat $sf | while read name path; do
  ( echo "-- $path"
    iget -f -v -N 4 -K $path/$barcode_path
    gunzip barcodes.tsv.gz
    mv barcodes.tsv $name.barcodes.tsv
    echo "✓"
    iget -f -v -N 4 -K $path/$bam_file
    mv $bam_file $name.bam
    iget -f -v -N 4 -K $path/$index_file
    mv $index_file $name.bam.bai
  )
done
