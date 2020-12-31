echo "Exporting the trained model"

rm -r tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite/*

export PYTHONPATH=$PYTHONPATH:$(pwd)/tf_od_api/models/research:$(pwd)/tf_od_api/models:$(pwd)/tf_od_api/models/research/object_detection
export CONFIG_FILE=$(pwd)/tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite/pipeline.config
export CHECKPOINT_PATH=$(pwd)/tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite
export OUTPUT_DIR=$(pwd)/tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite


python exporter_main_v2.py \
--input_type image_tensor \
--pipeline_config_path $CONFIG_FILE \
--trained_checkpoint_dir $CHECKPOINT_PATH \
--output_directory $OUTPUT_DIR \
/


echo "convert a SavedModel into a TensorFlow Lite model"

python convert_to_tflite.py --saved_model_dir=$(pwd)/tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite/saved_model \
--tflite_model_dir=$(pwd) \
/

mv model.tflite ../microservices/object_detection
