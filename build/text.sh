#!/bin/bash

set -xe

VER="0.8.1"
export BUILD_VERSION="$VER"

cd ~
mkdir pytorch || :
cd pytorch

git clone https://github.com/pytorch/text

cd audio
git checkout "v$VER"
git submodule sync
git submodule update --init --recursive

# pip install ninja

# cp setup.py setup.py.bak
# (sed "s/version\s=\s\'\(.\+\)/version = \'$VER\'/g" setup.py.bak) > setup.py

export MAX_JOBS=1
export BUILD_TEST=0

python3 setup.py build
python3 setup.py install
python3 setup.py bdist_wheel
