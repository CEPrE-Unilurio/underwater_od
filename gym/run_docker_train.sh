#!/bin/bash
#
# Copyright 2021  CEPrE-Unilurio 

# $1 - is model's name
#SBATCH -N1 -n1 --gres=gpu:k80:4 -p gpu
#SBATCH -J ai4coral 

for item in $(ls ai4coral/models)
do
    if [ "$1" == "$item" ]; then
        nvidia-docker run -v $(pwd)/ai4coral:/home registry.fsoc.hpi.uni-potsdam.de/ai4coral train.sh $1
        exit
    fi
done

echo 'there is no model named: ' $1

