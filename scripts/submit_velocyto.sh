#!/bin/bash

set -euo pipefail

#run this from work directory

script=../actions/velocyto.sh #selecting velocyto script to run
sf=../actions/samples.txt #selecting sample file

CPU=16 #selecting cpus
MEM=128000 #selecting memory 
GROUP="cellgeni" #selecting group to submit with
QUE="long" #selecting queue to submit to

###################### DONT CHANGE OPTIONS BELOW THIS LINE ###########################

if true; then
  mkdir -p logs
  cat $sf | while read name; do  
    bsub -n $CPU -Rspan[hosts=1] -M $MEM -R"select[mem>${MEM}] rusage[mem=${MEM}]" -G $GROUP -q $QUE -o logs/ooo.$name.%J.txt -e logs/eee.$name.%J.txt $script $name 
  done
fi
