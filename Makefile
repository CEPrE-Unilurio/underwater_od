OUTPUT_FILE = build/core.tflite
SAVED_MODEL = gym/tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite/saved_model
CONFIG_FILE = gym/tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite/pipeline.config
CHECKPOINT_PATH =
OUTPUT_DIR =  gym/tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite
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
export:
	python export_tflite_ssd_graph.py \
    --pipeline_config_path=$(CONFIG_FILE) \
    --trained_checkpoint_prefix=$(CHECKPOINT_PATH) \
    --output_directory=$(OUTPUT_DIR) \
    --add_postprocessing_op=true
eval:
	@echo "the outputs will be stored at ./tf_od_api/workspace/train_core/eval.log"
	@echo "the checkpoints will be stored at tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite"	
	@echo "evaluating ... grab a cup of coffee and wait ..."
	@cat tf_od_api/workspace/train_core/eval.sh > tf_od_api/workspace/train_core/core.sh
	@bash eval.sh

monitor:
	tensorboard --logdir=tf_od_api/workspace/train_core/models/ssd_mobilenet_v2_fpnlite/ --bind_all
convert_to_tflite:
	@echo "Converting trained model to tensorflow lite"
	python  convert_to_tflite.py  --output_file $(OUTPUT_FILE) \
	--saved_model_dir $(SAVED_MODEL)
convert_to_lite:
	tflite_convert \
    --saved_model_dir $(SAVED_MODEL) \
    --output_file=$(OUTPUT_FILE) \
    --input_shapes=1,640,640,3 \
    --input_arrays=normalized_input_image_tensor \
    --output_arrays='TFLite_Detection_PostProcess','TFLite_Detection_PostProcess:1','TFLite_Detection_PostProcess:2','TFLite_Detection_PostProcess:3' \
    --inference_type=FLOAT  \
    --allow_custom_ops
clean: 
	docker image prune
	docker container prune
