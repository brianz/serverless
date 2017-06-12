FROM node:8.1.0

ENV SERVERLESS_VERSION 1.15.0

RUN npm install serverless@${SERVERLESS_VERSION} -g

RUN apt-get update
RUN apt-get install -y \
    build-essential \
    curl \
    python-dev

RUN mkdir /root/.aws

RUN curl -s https://bootstrap.pypa.io/get-pip.py | python
RUN pip install \
    awscli \
    pep8 \
    pytest \
    pytest-cov \
    pytest-mock \
    pytest-watch \
    boto3

RUN echo "alias ll='ls -alFh --color=auto'" >> /root/.bashrc
RUN echo "alias l='ls -alFh --color=auto'" >> /root/.bashrc

RUN mkdir /code
WORKDIR /code
