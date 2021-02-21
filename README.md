## 1) Download the repository

``` git clone https://github.com/CEPrE-Unilurio/underwater_od.git ```

## Before running any of the command below  Make sure you are inside ``` underwater_od/gym ``` 

## 2) Set up the environment

``` make setup ```

## 3) Download pre-trained models
``` make download_models ```\
you should do this if and only if you do not have the pre-trained model already in you machine \
this code will save the pre-trained model inside``` underwater_od/ai4coral/pre-trained-models/ ```

## How to evaluate  a model (just for testing)
``` make model_name=ssd_mobilenet_v2_fpnlite eval ```

## How to evaluate a model using using slurm
``` make model_name=ssd_mobilenet_v2_fpnlite seval ```

## How to train a model (just for testing) 
``` make model_name=ssd_mobilenet_v2_fpnlite train ```

## How to train a model using using slurm
``` make model_name=ssd_mobilenet_v2_fpnlite strain ```

## How to monitor model training
``` make model_name=ssd_mobilenet_v2_fpnlite monitor ``` \

## How to export trained model
``` make model_name=ssd_mobilenet_v2_fpnlite export_to_tflite_graph ```

## How to convert exported model to tflite
``` make model_name=ssd_mobilenet_v2_fpnlite convert_to_tflite ```

### Note: model_name can be one the models listed in model ``` underwater_od/gym/models.list```
use ``` make clean ``` to clean up images and stoped containers, why? \
well, you will need it when you are run out of space trust me I am an engineer ...\

## PS: you have to use slurmsubmit to to run make commands that use slurm
