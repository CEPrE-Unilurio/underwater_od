build: 
	@echo "building docker image named coral-ai"
	docker build -t coral-ai .
registry: 
	@echo "registring the docker image named coral-ai"
	docker tag coral-ai registry.fsoc.hpi.uni-potsdam.de/coral-ai
	docker push registry.fsoc.hpi.uni-potsdam.de/coral-ai
run:
	@echo "the outputs will be stored at ./tf_od_api/workspace/train_core/log"
	@echo "the trained model will be exported to ./tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite"
	@echo "the checkpoints will be stored at tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite"
	@echo "running ... grab a cup of coffee and wait ..."
	bash run.sh
clean: 
	docker image prune
	docker container prune
