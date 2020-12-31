tflite_convert --output_file $OUTPUT_CORE_LITE_MODEL \
--saved_model_dir   $CORE_MODEL \
--output_format TFLITE \
--inference_type FLOAT \
--input_arrays image_tensor \
--input_shapes 1,640,640,3 \
--output_arrays detection_boxes,detection_classes,detection_scores,num_detections
