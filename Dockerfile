FROM ubuntu:16.04
MAINTAINER vincent

RUN apt-get update \
&& apt-get install -y python3-pip python3-dev \
&& cd /usr/local/bin \
&& ln -s /usr/bin/python3 python \
&& pip3 install --upgrade pip \
&& apt-get install -y vim  \
&& apt-get -y install git

RUN apt-get -y install git

RUN git clone https://github.com/VincentLansardiere/cours_Python.git

WORKDIR /Docker
ADD . /workspace
WORKDIR /workspace
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
EXPOSE 80000
CMD workspace --port 8888

