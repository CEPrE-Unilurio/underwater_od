cd /home

rm -f models/$1/ckpt*
rm -rf models/$1/train


python model_main_tf2.py \
--model_dir=models/$1 \
--pipeline_config_path=models/$1/pipeline.config
