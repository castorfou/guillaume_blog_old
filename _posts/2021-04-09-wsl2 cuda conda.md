---
title: "setup wsl2 with cuda and conda"
description: best of breed windows + linux
toc: true
comments: true
layout: post
categories: [wsl, cuda, conda]
---



## wsl2 and network + proxychains

workaround explained in [this blog entry](https://castorfou.github.io/guillaume_blog/blog/Windows10-fastai-wsl2-cuda.html#Workaround-network-issue-with-WSL2)



## cuda

https://docs.nvidia.com/cuda/wsl-user-guide/index.html#installing-nvidia-drivers

install nvidia cuda specific driver for WSL: https://developer.nvidia.com/cuda/wsl on windows. (version 470.14_quadro_win10-dch_64bit_international in my case) 



```bash
proxychains wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo proxychains add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo proxychains apt-get update
sudo proxychains apt-get -y install cuda-toolkit-11-2
```





## conda

from https://docs.conda.io/en/latest/miniconda.html

download https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

and install with `./Miniconda3-latest-Linux-x86_64.sh -p $HOME/miniconda3`



## pycaret

```bash
conda create --name pycaret python=3.7
conda activate pycaret3

proxychains pip install pycaret shap
proxychains conda install -c conda-forge  nb_conda jupyter_contrib_nbextensions fire pyfiglet openpyxl
jupyter contrib nbextensions install --user
proxychains conda upgrade nbconvert

```