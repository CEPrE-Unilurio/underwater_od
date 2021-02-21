wget http://download.tensorflow.org/models/object_detection/tf2/20200711/ssd_mobilenet_v2_fpnlite_640x640_coco17_tpu-8.tar.gz
tar -xvf ssd_mobilenet_v2_fpnlite_640x640_coco17_tpu-8.tar.gz
rm ssd_mobilenet_v2_fpnlite_640x640_coco17_tpu-8.tar.gz
cp -rf ssd_mobilenet_v2_fpnlite_640x640_coco17_tpu-8/*  ai4coral/pre-trained-models/ssd_mobilenet_v2_fpnlite
rm -rf ssd_mobilenet_v2_fpnlite_640x640_coco17_tpu-8
