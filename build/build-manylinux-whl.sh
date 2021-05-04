#!/usr/bin/env bash

# Build using official manylinux wheels

set -xe

bash manylinux/deps.sh

BIN_PATH=$1
LD_LIBRARY_PATH=$2

"$BIN_PATH""pip" install -U torch -f https://ext.maku.ml/wheels.html  # -f https://download.pytorch.org/whl/torch_stable.html

mkdir output || :
mkdir whl || :

bash manylinux/vision.sh "0.9.1" "v0.9.1" "$BIN_PATH" "$LD_LIBRARY_PATH"

bash manylinux/audio.sh "0.8.1" "v0.8.1" "$BIN_PATH" "$LD_LIBRARY_PATH" || bash manylinux/audio.sh "0.8.1" "v0.8.1" "$BIN_PATH" "$LD_LIBRARY_PATH"

bash manylinux/text.sh "0.9.1" "v0.9.1-rc1" "$BIN_PATH" "$LD_LIBRARY_PATH"

bash manylinux/csprng.sh "0.2.1" "v0.2.1" "$BIN_PATH" "$LD_LIBRARY_PATH"
