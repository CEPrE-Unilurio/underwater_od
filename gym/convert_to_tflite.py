import tensorflow as tf
import sys, getopt

def main(argv):
    saved_model_di = ''
    output_file = ''
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["saved_model_dir=","output_file="])
    except getopt.GetoptError:
        print('convert_to_tflite.py -i <saved_model_dir> -o <output_file>')
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print ('convert_to_tflite.py -i <saved_model_dir> -o output_file>')
            sys.exit()
        elif opt in ("-i", "--saved_model_dir"):
            saved_model_dir = arg
        elif opt in ("-o", "--output_file"):
            output_file = arg
    
    converter = tf.compat.v2.lite.TFLiteConverter.from_saved_model(saved_model_dir)

    tflite_model = converter.convert()

    with open(output_file, 'wb') as f:
        f.write(tflite_model)
        print("Done!")

if __name__ == "__main__":
   main(sys.argv[1:])
