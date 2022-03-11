#!/usr/bin/env bash

set -ex

export CC=/opt/rh/devtoolset-8/root/usr/bin/gcc
export GCC=/opt/rh/devtoolset-8/root/usr/bin/gcc
export CPP=/opt/rh/devtoolset-8/root/usr/bin/cpp  # not g++
export CXX=/opt/rh/devtoolset-8/root/usr/bin/g++

VER="FORMAT_PYTORCH_VERSION"
export PYTORCH_BUILD_VERSION="$VER"
export PYTORCH_BUILD_NUMBER="1"

rm build/CMakeCache.txt || :
# export MAX_JOBS=1
export BUILD_TEST=0
export USE_BREAKPAD=0

python3 setup.py build
python3 setup.py install

OUTPUT_PATH="/tmp/output/FORMAT_PYTHON_VERSION"
mkdir -p "$OUTPUT_PATH"
python3 setup.py bdist_wheel
mv dist "$OUTPUT_PATH/"
