#!/usr/bin/env bash

# Build using official manylinux wheels

set -xe

# Preparation

ln -s /usr/bin/ninja-build /usr/bin/ninja || :
export CC=/opt/rh/devtoolset-9/root/usr/bin/gcc
export CPP=/opt/rh/devtoolset-9/root/usr/bin/g++
export GCC=/opt/rh/devtoolset-9/root/usr/bin/gcc
export CXX=/opt/rh/devtoolset-9/root/usr/bin/g++

git clone https://github.com/glennrp/libpng || :
cd libpng
git checkout v1.6.37
./configure --enable-shared
make "-j$(nproc)"
make install
cd ..

# Build

cd py39
bash build-manylinux-whl.sh "/opt/python/cp39-cp39/bin/" "/opt/_internal/cpython-3.9.2/lib/python3.9/site-packages/torch/lib"
cd ..


