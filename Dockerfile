FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Create working directory
WORKDIR /root/langchain_llama2

# Git clone all the files into docker container
RUN apt-get -y update && apt-get install -y software-properties-common git cmake wget pkg-config tree

# ADD scripts to docker container
COPY . .

# install libs from apt
RUN bash ./setup.sh

# Install dependencies and Run LLM
# CMD tree /root/langchain_llama2 && python3 src/inf_llama2-13B-q3.py