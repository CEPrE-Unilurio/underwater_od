config: 
	@echo "building docker image named coral-ai"
	docker build -t coral-ai .
	@echo "registring the docker image named coral-ai"
	docker tag coral-ai registry.fsoc.hpi.uni-potsdam.de/coral-ai
	docker push registry.fsoc.hpi.uni-potsdam.de/coral-ai
train:
	@echo "the outputs will be stored at ./tf_od_api/workspace/train_core/train.log"
	@echo "the checkpoints will be stored at tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite"
	@echo "training ... grab a cup of coffee and wait ..."
	@cat tf_od_api/workspace/train_core/train.sh > tf_od_api/workspace/train_core/core.sh
	@bash train.sh
export_model:
	@bash export_model.sh
eval:
	@echo "the outputs will be stored at ./tf_od_api/workspace/train_core/eval.log"
	@echo "the checkpoints will be stored at tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite"	
	@echo "evaluating ... grab a cup of coffee and wait ..."
	@cat tf_od_api/workspace/train_core/eval.sh > tf_od_api/workspace/train_core/core.sh
	@bash eval.sh

monitor:
	tensorboard --logdir=tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite/ --bind_all
build:
	@bash build.sh
clean: 
	docker image prune
	docker container prune
