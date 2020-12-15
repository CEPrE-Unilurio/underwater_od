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
    
    print("tf version {}".format(tf.__version__))

    converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)
    tflite_model = converter.convert()

    with open('{}.tflite'.format(tflite_model_dir), 'wb') as f:
        f.write(tflite_model)

if __name__ == "__main__":
   main(sys.argv[1:])