#!/bin/bash
#
# Copyright 2021  CEPrE-Unilurio 

# $1 - is model's name

cd /home


rm -f models/$1/ckpt*
rm -f models/$1/checkpoint
rm -rf models/$1/train


rm -rf models/$1/eval

PIPELINE_CONFIG_PATH=models/$1/pipeline.config
MODEL_DIR=models/$1
SAMPLE_1_OF_N_EVAL_EXAMPLES=1
python model_main_tf2.py --model_dir=$MODEL_DIR \
--sample_1_of_n_eval_examples=$SAMPLE_1_OF_N_EVAL_EXAMPLES \
--pipeline_config_path=$PIPELINE_CONFIG_PATH \
--alsologtostderr

exit $?
