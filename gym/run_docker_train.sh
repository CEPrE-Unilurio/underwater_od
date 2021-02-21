#!/bin/bash
#
# Copyright 2021  CEPrE-Unilurio 

# $1 - is model's name
#SBATCH --gres=gpu:v100:8  -p dgx -J ai4coral-train-dgx

version=1.2

for model in $(ls ai4coral/models)
do
    if [ "$1" == "$model" ]; then
        chmod 777 -Rf ai4coral/models/$1
        nvidia-docker run -v $(pwd)/ai4coral:/home registry.fsoc.hpi.uni-potsdam.de/ai4coral:$version train.sh $1
        exit
    fi
done

echo 'there is no model named: ' $1

