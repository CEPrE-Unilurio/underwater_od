#!/bin/bash
#
# Copyright 2021  CEPrE-Unilurio 

# $1 - is model's name
#SBATCH --gres=gpu:k80:4  -p gpu -J ai4coral

for model in $(ls ai4coral/models)
do
    if [ "$1" == "$model" ]; then
        nvidia-docker run -v $(pwd)/ai4coral:/home registry.fsoc.hpi.uni-potsdam.de/ai4coral:latest  train.sh $1
        exit
    fi
done

echo 'there is no model named: ' $1

