#!/bin/bash 

KK=`cut -f1 ../actions/samples.tsv`
PP=`cut -f2 ../actions/samples.tsv`

a=( $KK ) 
b=( $PP ) 

N=`cat ../actions/samples.tsv | wc -l`

for i in `seq 0 $((N-1))`
do
  echo "Downloading files for sample ${b[$i]}, directory ${a[$i]}.."
  iget ${a[$i]}/gex_possorted_bam.bam
  mv gex_possorted_bam.bam ${b[$i]}.bam 
  iget ${a[$i]}/gex_possorted_bam.bam.bai
  mv gex_possorted_bam.bam.bai ${b[$i]}.bam.bai
  iget ${a[$i]}/filtered_feature_bc_matrix/barcodes.tsv.gz
  gzip -d barcodes.tsv.gz
  mv barcodes.tsv ${b[$i]}.barcodes.tsv
done 

echo "ALL DONE!" 
