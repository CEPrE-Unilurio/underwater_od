FROM continuumio/anaconda3

WORKDIR /opt

# Create the environment:
RUN conda create -n tf-gpu tensorflow-gpu

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "tf-gpu", "/bin/bash", "-c"]

# Make sure the environment is activated:
RUN echo "Make sure tensorflow is installed:"
RUN python -c "import tensorflow"

COPY ./tf_od_api ./tf_od_api
COPY ./cocoapi ./cocoapi
COPY *.sh ./

ENV PYTHONPATH "/opt/tf_od_api/models/research:/opt/tf_od_api/models"

RUN apt-get update &&  apt-get install apt-utils -y && apt-get install vim -y && apt-get install build-essential -y && apt-get install tree -y
RUN python -m pip install PyYAML
RUN python -m pip install lvis
RUN conda install -c anaconda absl-py
RUN cd /opt/tf_od_api/models/research && python -m pip install . 
RUN cd /opt/cocoapi/PythonAPI && make && python setup.py build_ext install && cp -r pycocotools /opt/tf_od_api/models/research/
RUN cd /opt/tf_od_api/models/research && python object_detection/builders/model_builder_tf2_test.py

ENTRYPOINT ["conda", "run", "-n", "tf-gpu", "bash", "entry_script.sh"]
