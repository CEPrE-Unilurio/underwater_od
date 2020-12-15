#convert a SavedModel into a TensorFlow Lite model  
python convert_to_tflite.py --saved_model_dir=tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite/saved_model \
--tflite_model_dir=../microservices/object_detection \
/
