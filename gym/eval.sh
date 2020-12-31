chmod 777 -Rf tf_od_api/workspace/train_core/
nvidia-docker run -it -v $(pwd)/tf_od_api/workspace/train_core:/home registry.fsoc.hpi.uni-potsdam.de/coral-ai > tf_od_api/workspace/train_core/eval.log
