export PYTHONPATH=$PYTHONPATH:$(pwd)/tf_od_api/models/research:$(pwd)/tf_od_api/models

python export_tflite_graph_tf2.py \
--pipeline_config_path $1 \
--trained_checkpoint_dir $2 \
--output_directory $3
