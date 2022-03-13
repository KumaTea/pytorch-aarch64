#!/usr/bin/env bash

set -ex

# export CC=/opt/rh/devtoolset-8/root/usr/bin/gcc
# export GCC=/opt/rh/devtoolset-8/root/usr/bin/gcc
# export CPP=/opt/rh/devtoolset-8/root/usr/bin/cpp  # not g++
# export CXX=/opt/rh/devtoolset-8/root/usr/bin/g++

VER="FORMAT_PYTORCH_VERSION"
export PYTORCH_BUILD_VERSION="$VER"
export PYTORCH_BUILD_NUMBER="1"

rm build/CMakeCache.txt || :
# export MAX_JOBS=1
export USE_NINJA=0

export BUILD_TEST=0
export USE_BREAKPAD=0

$PYTHON setup.py build
$PYTHON setup.py install

OUTPUT_PATH="/mnt/usb/pytorch/dists/FORMAT_PYTHON_VERSION"
mkdir -p "$OUTPUT_PATH"
$PYTHON setup.py bdist_wheel
mv dist "$OUTPUT_PATH/"
