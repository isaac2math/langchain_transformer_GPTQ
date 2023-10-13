<h3 align="center"> LLM: Experiment Branch </h3>
<h4 align="center"> Isaac W. N. Xu </h4>

### Please note that

- This branch is only to experiment the new features and updates of the LLM deployment.
- For proper deployment, please see the *"release"* branch
- For development, please see the *"dev"* branch
 
#### File structure

```txt
├── data
│   ├── feature
│   │   ├── os-1.txt
│   │   ├── test1_0.txt
│   │   ├── test1_1.txt
│   │   ├── test1_2.txt
│   │   ├── test1_3.txt
│   │   └── test1.txt
│   ├── raw
│   │   └── os-1.pdf
│   ├── READEME.md
│   └── transform
├── db
│   └── 648a1b18-a507-40c3-8cf6-c417c2675127
├── docker
├── Dockerfile
├── LICENSE
├── model
│   └── README.md
├── notebook
│   ├── prompt_engi.ipynb
│   ├── test.ipynb
│   └── trial.ipynb
├── README.md
├── result
│   ├── long_sum.txt
│   └── short_sum.txt
├── setup.sh
├── src
└── transformer_GPTQ.yaml
```

#### Native Deployment on Linux

- Install Miniconda:
 
```sh
cd ~
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash miniconda.sh
```

- Clone the repo:
 
```sh
git clone https://github.com/isaac2math/langchain_transformer_GPTQ
```

- Set up conda environment
  
  - Make sure the pytorch wheel and the cuda of this env share the same version; otherwise cuda error would appear;
  - Currently 11.7.1 and 11.8.0 are tested;
  - Currently only NV-GPUs are supported;

```sh
cd langchain_transformer_GPTQ

conda create -n langchain_transformer_GPTQ python=3.11 -y

conda activate langchain_transformer_GPTQ

conda install cuda -c nvidia/label/cuda-11.8.0 -y

pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

pip install -r requirements_exp.txt
```

- Load pretrained-LLM: you can load your model by
  - downloading directly from HF using `git lfs`;
    - beware of the FS incompatibility between HFS and Windows thingy;
  - downloading directly from HF using `HF-hub`;
    - see it [here](https://huggingface.co/docs/hub/index);
  - downloading directly from HF using `AutoModelForCausalLM.from_pretrained` from `HF-transformers`;
    - see it [here](https://huggingface.co/docs/transformers/model_doc/auto);
  - loading your own model from the drive;
  - <s>loading your model using AutoGPTQ and GPTQ</s>
  - <s>loading your model using vllm</s>

#### Inference

- `ipython ./notebook/test.ipynb` and test whether you can deploy it on your device
  - `./notebook/test.ipynb` is based on llama2-7B under GPTQ-4bit-128g quantization.
  - it should only cost 8G VRAM for model loading and another 1G for running
- `ipython ./notebook/trial.ipynb` for long and short context summary using GPTQ
  - the original sum is produced using LLM "wd-0.0.1"

#### Dependency

- This repo is for in-house and offline LLM application
- Currently this repo relies on
  - `langchain`
  - `CUDA`
  - `Transformers`
  - `AutoGPTQ`
  - `LangChain`

#### Roadmap

- [x] Replace AutoGPTQ with HG-Transformers
- [x] Increase the upper limit of the context token to 10k
- [ ] Inplement RAG

#### Contact

Isaac N. Xu - [@email](xuningandy@gmail.com)

