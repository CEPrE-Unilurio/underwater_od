cd /home


rm -rf models/$1/eval


python model_main_tf2.py \
--model_dir=models/$1 \
--pipeline_config_path=models/$1/pipeline.config \
--checkpoint_dir=models/$1
