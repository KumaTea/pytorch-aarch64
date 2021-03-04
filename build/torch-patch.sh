#!/bin/bash

set -xe

VER="$1"
export PYTORCH_BUILD_VERSION="$VER"
export PYTORCH_BUILD_NUMBER="1"

git clone https://github.com/pytorch/pytorch torch || :

cd torch

rm 160.patch || :
wget https://github.com/pytorch/pytorch/files/4363087/QNNPACK-q8gemm-8x8-dq-aarch64-neon.S-fix-mov-operand.patch.txt -O 160.patch
git apply -R 160.patch || :

git checkout "$2"
git checkout --recurse-submodules "$2"
git submodule sync
git submodule update --init --recursive

git apply 160.patch || :

rm build/CMakeCache.txt || :
# export MAX_JOBS=1
export BUILD_TEST=0

python3 setup.py build
python3 setup.py install
python3 setup.py bdist_wheel
