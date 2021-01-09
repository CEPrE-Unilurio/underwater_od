FROM continuumio/miniconda

WORKDIR /opt

SHELL ["conda", "run", "-n", "base", "/bin/bash", "-c"]

RUN conda install python=3.8 
RUN conda install cudatoolkit=11.0
RUN conda install pip
RUN pip install tensorflow_gpu==2.4

COPY . .

RUN echo "Make sure tensorflow is installed:"
RUN python -c "import tensorflow"


ENV PYTHONPATH "/opt/tf_od_api/models/research:/opt/tf_od_api/models"
RUN python -m pip install lvis
RUN python -m pip install PyYAML
RUN conda install -c anaconda absl-py
RUN apt-get update &&  apt-get install apt-utils -y && apt-get install vim -y && apt-get install build-essential -y && apt-get install tree -y
RUN cd cocoapi/PythonAPI && make && python setup.py build_ext install && cp -r pycocotools /opt/tf_od_api/models/research/
RUN cd tf_od_api/models/research && python -m pip install . 
RUN cd tf_od_api/models/research && python object_detection/builders/model_builder_tf2_test.py

ENTRYPOINT ["bash"]
