#!/usr/bin/env bash

set -xe

VER="$1"
export PYTORCH_BUILD_VERSION="$VER"
export PYTORCH_BUILD_NUMBER="1"

git clone https://github.com/pytorch/pytorch torch || :

cd torch
git checkout "v$VER"
git checkout --recurse-submodules "v$VER"
git submodule sync
git submodule update --init --recursive

rm build/CMakeCache.txt || :
# export MAX_JOBS=1
export BUILD_TEST=0
export USE_BREAKPAD=0

python3 setup.py build
python3 setup.py install
python3 setup.py bdist_wheel
