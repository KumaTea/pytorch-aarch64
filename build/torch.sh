#!/bin/bash

set -xe

VER="1.7.1"
export PYTORCH_BUILD_VERSION="$VER"

cd ~
mkdir pytorch || :
cd pytorch

git clone https://github.com/pytorch/pytorch
mv pytorch torch

cd torch
git checkout "v$VER"
git submodule sync
git submodule update --init --recursive

apt install -y build-essential cmake
# pip install ninja

# cp version.txt version.txt.bak
# (echo "$VER" | sed 's/v//g') > version.txt
# echo "$VER" > version.txt

export MAX_JOBS=1
export BUILD_TEST=0

python3 setup.py build
python3 setup.py install
python3 setup.py bdist_wheel
