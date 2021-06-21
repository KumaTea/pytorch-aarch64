#!/usr/bin/env bash

set -ex

PYVER=$1

sudo apt update
sudo apt install -y git software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt install -y $PYVER

bash test/check-arch.sh
$PYVER -m pip install -U pip setuptools wheel
$PYVER -m pip install cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.kmtea.eu/whl/stable.html
$PYVER -m pip install torch -f https://torch.kmtea.eu/whl/stable.html
$PYVER -m pip install torchvision torchaudio torchtext -f https://torch.kmtea.eu/whl/stable.html
# Temporarily skip torchcsprng
$PYVER test/torch-test.py
