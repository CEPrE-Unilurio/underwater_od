import tensorflow as tf
## TFLite Conversion
model_dir = "tf_od_api/workspace/train_core/exported-models/ssd_mobilenet_v2_fpnlite/saved_model"
model_dir = "tf_od_api/workspace/train_core/pre-trained-models/efficientdet_d0/saved_model"

model = tf.saved_model.load(model_dir)
model.signatures[tf.saved_model.DEFAULT_SERVING_SIGNATURE_DEF_KEY].inputs[0].set_shape([1, 256, 256, 3])
tf.saved_model.save(model, "saved_model_updated", signatures=model.signatures[tf.saved_model.DEFAULT_SERVING_SIGNATURE_DEF_KEY])

# Convert
converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir='saved_model_updated', signature_keys=['serving_default'])
converter.optimizations = [tf.lite.Optimize.DEFAULT]
converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS, tf.lite.OpsSet.SELECT_TF_OPS]
tflite_model = converter.convert()

## TFLite Interpreter to check input shape
interpreter = tf.lite.Interpreter(model_content=tflite_model)
interpreter.allocate_tensors()

# Get input and output tensors.
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Test the model on random input data.
input_shape = input_details[0]['shape']
print(input_shape)
