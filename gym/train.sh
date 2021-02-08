#!/bin/bash
#
# Copyright 2021  CEPrE-Unilurio 

# $1 - is model's name

cd /home


rm -f models/$1/ckpt*
rm -f models/$1/checkpoint
rm -rf models/$1/train


rm -rf models/$1/eval

python model_main_tf2.py --model_dir=models/$1 --pipeline_config_path=models/$1/pipeline.config --checkpoint_dir=models/$1 &

python model_main_tf2.py --model_dir=models/$1 --pipeline_config_path=models/$1/pipeline.config

exit $?
