import tensorflow as tf
import sys, getopt

def main(argv):
    saved_model_di = ''
    tflite_model_dir = ''
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["saved_model_dir=","tflite_model_dir="])
    except getopt.GetoptError:
        print('convert_to_tflite.py -i <saved_model_dir> -o <tflite_model_dir>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print ('convert_to_tflite.py -i <saved_model_dir> -o <tflite_model_dir>')
            sys.exit()
        elif opt in ("-i", "--saved_model_dir"):
            saved_model_dir = arg
        elif opt in ("-o", "--tflite_model_dir"):
            tflite_model_dir = arg
    

    converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)

    #converter.optimizations = [tf.lite.Optimize.DEFAULT]
    #converter.experimental_new_converter = True
    converter.target_spec.supported_ops = [tf.lite.OpsSet.TFLITE_BUILTINS, tf.lite.OpsSet.SELECT_TF_OPS]
    tflite_model = converter.convert()

    with open('{}/model.tflite'.format(tflite_model_dir), 'wb') as f:
        f.write(tflite_model)
        print("SavedModel converted into a TensorFlow Lite model")

if __name__ == "__main__":
   main(sys.argv[1:])
