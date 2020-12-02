cd /opt/tf_od_api/workspace/train_core

echo "Training the model"

python model_main_tf2.py \
--model_dir=/home/models/ssd_mobilenet_v2_fpnlite \
--pipeline_config_path=/home/models/ssd_mobilenet_v2_fpnlite/pipeline.config \
/

echo "Exporting the trained model"

python exporter_main_v2.py \
--input_type image_tensor \
--pipeline_config_path /home/models/ssd_mobilenet_v2_fpnlite/pipeline.config \
--trained_checkpoint_dir /home/models/ssd_mobilenet_v2_fpnlite \
--output_directory /home/exported-models/ssd_mobilenet_v2_fpnlite \
/

echo "Evaluating the trained model"

python model_main_tf2.py \
--model_dir=/home/models/ssd_mobilenet_v2_fpnlite \
--pipeline_config_path=/home/models/ssd_mobilenet_v2_fpnlite/pipeline.config \
--checkpoint_dir=/home/models/ssd_mobilenet_v2_fpnlite \
/
