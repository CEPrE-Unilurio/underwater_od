#!/bin/bash
#
# Copyright 2021  CEPrE-Unilurio 

# $1 - is model's name



cd /home

PIPELINE_CONFIG_PATH=$(pwd)/models/$1/pipeline.config
MODEL_DIR=$(pwd)/models/$1

python model_main_tf2.py \
--pipeline_config_path=${PIPELINE_CONFIG_PATH} \
--model_dir=${MODEL_DIR} \
--checkpoint_dir=${MODEL_DIR} \
exit
