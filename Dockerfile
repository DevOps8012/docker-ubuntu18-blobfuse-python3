FROM jeffreybreen/ubuntu18-blobfuse

# install Python 3 per fnndsc/ubuntu-python3
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && rm -rf /var/lib/apt/lists/* \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip \
  && rm -fr ~/.cache/pip

COPY printenv.py /usr/local/bin/
RUN chmod 755 /usr/local/bin/printenv.py
