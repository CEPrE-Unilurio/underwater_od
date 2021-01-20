export PYTHONPATH=$PYTHONPATH:$(pwd)/tf_od_api/models/research:$(pwd)/tf_od_api/models

python export_tflite_graph_tf2.py \
--pipeline_config_path ai4coral/models/$1/pipeline.config \
--trained_checkpoint_dir ai4coral/models/$1 \
--output_directory ai4coral/exported-models/$1
