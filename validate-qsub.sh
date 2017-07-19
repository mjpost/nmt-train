#!/bin/bash

. ./params.txt

if [[ -z $1 ]]; then
    echo "Usage: validate-qsub.sh MODEL"
    exit 1
fi

# Calls validate.sh with qsub. Adjust flags to your needs.
[[ ! -d logs ]] && mkdir logs
qsub -S /bin/bash -V -cwd -q gpu.q -l gpu=1,h_rt=4:00:00 -j y -o logs/ $TRAIN/validate.sh $1