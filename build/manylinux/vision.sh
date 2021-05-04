#!/usr/bin/env bash

set -xe

VER="$1"
export BUILD_VERSION="$VER"

git clone https://github.com/pytorch/vision || :

cd vision
git checkout "$2"
git checkout --recurse-submodules "$2"
git submodule sync
git submodule update --init --recursive
cd ..

# export MAX_JOBS=1
export BUILD_TEST=0
export USE_FFMPEG=1
export LD_LIBRARY_PATH="$4"

BIN_PATH=$3
THIS_PATH=$(pwd)

# "$BIN_PATH""python3" setup.py build
# "$BIN_PATH""python3" setup.py install
# "$BIN_PATH""python3" setup.py bdist_wheel
"$BIN_PATH""pip" -v wheel "$THIS_PATH/vision" -w output
"$BIN_PATH""python3" /opt/_internal/tools/bin/auditwheel repair "$THIS_PATH/output/torchvision*whl" -w "$THIS_PATH/whl"
