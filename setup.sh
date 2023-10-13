#!/bin/sh

add-apt-repository --yes ppa:deadsnakes/ppa && apt install -y python3.10 python3-pip build-essential libssl-dev libffi-dev python3-venv

pip install -Uq pip
pip install -Uq torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 
pip install -Uq transformers>=4.32.0 
pip install -Uq optimum>=1.12.0 
pip install -Uq langchain==0.0.266 
pip install -Uq bitsandbytes==0.41.1 
pip install -Uq accelerate==0.23.0
pip install -Uq chromadb==0.4.5 
pip install -Uq pypdf==3.15.0 
pip install -Uq xformers==0.0.20 
pip install -Uq sentence_transformers==2.2.2 
pip install -Uq InstructorEmbedding==1.0.1 
pip install -Uq auto-gptq==0.4.2 --extra-index-url https://huggingface.github.io/autogptq-index/whl/cu118/  # Use cu117 if on CUDA 11.7

