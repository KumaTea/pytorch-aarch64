#!/usr/bin/env bash

set -xe

VER="FORMAT_TORCHVISION_VERSION"
export BUILD_VERSION="$VER"


# export MAX_JOBS=1
export USE_NINJA=0
export BUILD_TEST=0


$PYTHON setup.py build
$PYTHON setup.py install

OUTPUT_PATH="/mnt/usb/pytorch/dists/FORMAT_PYTHON_VERSION"
mkdir -p "$OUTPUT_PATH"
$PYTHON setup.py bdist_wheel
mv dist "$OUTPUT_PATH/"
