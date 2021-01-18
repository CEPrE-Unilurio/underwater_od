setup: 
	@echo "building docker image named ai4coral"
	docker build -t ai4coral .
	@echo "registring the docker image named ai4coral"
	docker tag ai4coral registry.fsoc.hpi.uni-potsdam.de/ai4coral
	docker push registry.fsoc.hpi.uni-potsdam.de/ai4coral
train: run_docker_train.sh
	@echo "training ...  grab a cup of coffee and wait ..."
	bash run_docker_train.sh $(model_name)
export_to_tflite_graph:
	@echo 'Exporting TF2 detection SavedModel to TensorFlow Lite Graph'
	@bash export_tflite_graph.sh $(pipeline_config_path) $(trained_checkpoint_dir) $(output_directory)
eval: run_docker_eval.sh
	@echo "evaluating ... grab a cup of coffee and wait ..."
	bash run_docker_eval.sh $(model_dir_name)
run_docker:
	bash run_docker.bash
download_models:
	bash download_models.bash
monitor:
	tensorboard --logdir=tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite/ --bind_all
convert_to_tflite:
	@echo "Converting to tensorflow lite model"
	bash convert_to_tflite.sh $(saved_model_dir) $(output_file)
clean: 
	docker image prune
	docker container prune
