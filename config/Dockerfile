FROM continuumio/anaconda3

WORKDIR /opt

# Create the environment:
RUN conda create -n tf-gpu tensorflow-gpu

# Make RUN commands use the new environment:
SHELL ["conda", "run", "-n", "tf-gpu", "/bin/bash", "-c"]

# Make sure the environment is activated:
RUN echo "Make sure tensorflow is installed:"
RUN python -c "import tensorflow"

# The code to run when container is started:
COPY ./tf_od_api ./tf_od_api

ENV PYTHONPATH "/opt/tf_od_api/models/research:/opt/tf_od_api/models"

RUN apt-get install apt-utils -y
RUN apt-get install vim -y
RUN apt-get install build-essential -y
RUN apt-get install tree
RUN python -m pip install PyYAML

RUN cd /opt/tf_od_api/models/research && python -m pip install .
RUN cd /opt/tf_od_api/models/research && python object_detection/builders/model_builder_tf2_test.py
