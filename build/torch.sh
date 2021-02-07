#!/bin/bash

set -xe

VER="1.7.1"
export PYTORCH_BUILD_VERSION="$VER"
export PYTORCH_BUILD_NUMBER="1"

git clone https://github.com/pytorch/pytorch torch || :

cd torch
git checkout "v$VER"
git submodule sync
git submodule update --init --recursive

export MAX_JOBS=1
export BUILD_TEST=0

python3 setup.py build
python3 setup.py install
python3 setup.py bdist_wheel
