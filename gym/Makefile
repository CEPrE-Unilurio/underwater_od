#default values 

model_name=ssd_mobilenet_v2_fpnlite
version=1.2
setup: 
	@echo "building docker image named ai4coral"
	docker build -t ai4coral:$(version) .
	@echo "registring the docker image named ai4coral"
	docker tag ai4coral:$(version) registry.fsoc.hpi.uni-potsdam.de/ai4coral:$(version)
	docker push registry.fsoc.hpi.uni-potsdam.de/ai4coral:$(version)
train:
	@echo "training ...  grab a cup of coffee and wait ..."
	bash run_docker_train.sh $(model_name)
strain:
	@echo "training with gpu...  grab a cup of coffee and wait ..."
	sbatch run_docker_train.sh $(model_name)
eval:
	@echo "training ...  grab a cup of coffee and wait ..."
	bash run_docker_eval.sh $(model_name)
seval:
	@echo "training with gpu...  grab a cup of coffee and wait ..."
	sbatch run_docker_eval.sh $(model_name)
export_to_tflite_graph:
	@echo 'Exporting TF2 detection SavedModel to TensorFlow Lite Graph'
	@bash export_tflite_graph.sh $(model_name)
run_docker:
	bash run_docker.sh
download_models:
	bash download_models.sh
monitor:
	bash monitor.sh $(model_name)
convert_to_tflite:
	@echo "Converting to tensorflow lite model"
	bash convert_to_tflite.sh $(model_name)
clean: 
	docker image prune
	docker container prune
stop:
	@bash stop_containers.sh

