setup: 
	@echo "building docker image named ai4coral"
	docker build -t ai4coral:latest .
	@echo "registring the docker image named ai4coral"
	docker tag ai4coral:latest registry.fsoc.hpi.uni-potsdam.de/ai4coral:latest
	docker push registry.fsoc.hpi.uni-potsdam.de/ai4coral:latest
train: run_docker_train.sh
	@echo "training ...  grab a cup of coffee and wait ..."
	bash run_docker_train.sh $(model_name)
strain: run_docker_train.sh
	@echo "training with gpu...  grab a cup of coffee and wait ..."
	sbatch run_docker_train.sh $(model_name)

export_to_tflite_graph:
	@echo 'Exporting TF2 detection SavedModel to TensorFlow Lite Graph'
	@bash export_tflite_graph.sh $(model_name)
run_docker:
	bash run_docker.bash
download_models:
	bash download_models.bash
monitor:
	bash monitor.bash $(model_name)
convert_to_tflite:
	@echo "Converting to tensorflow lite model"
	bash convert_to_tflite.sh $(model_name)
clean: 
	docker image prune
	docker container prune
