echo "Exporting core model"

export PYTHONPATH=$PYTHONPATH:$(pwd)/tf_od_api/models/research:$(pwd)/tf_od_api/models
export CONFIG_FILE=$(pwd)/tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite/pipeline.config
export CHECKPOINT_PATH=$(pwd)/tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite
export OUTPUT_DIR=$(pwd)/tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite

cd tf_od_api/models/research/object_detection/

python exporter_main_v2.py \
--input_type image_tensor \
--pipeline_config_path $CONFIG_FILE \
--trained_checkpoint_dir $CHECKPOINT_PATH \
--output_directory $OUTPUT_DIR \
/
