cd /opt/tf_od_api/workspace/train_core

echo "Evaluating the model"

python model_main_tf2.py \
--model_dir=/home/models/ssd_mobilenet_v2_fpnlite \
--pipeline_config_path=/home/models/ssd_mobilenet_v2_fpnlite/pipeline.config \
--checkpoint_dir=/home/models/ssd_mobilenet_v2_fpnlite \
/
