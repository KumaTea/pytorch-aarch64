#!/usr/bin/env bash

# Build using official manylinux wheels

set -xe

echo "Building PyTorch"

bash deps.sh

pip install -U torch -f https://download.pytorch.org/whl/torch_stable.html -f https://ext.maku.ml/wheels.html

cp -a vision vision-bak || :
export USE_FFMPEG=1
bash vision.sh "0.9.1" "v0.9.1"

bash audio.sh "0.8.1" "v0.8.1" || bash audio.sh "0.8.1" "v0.8.1"
# Yes, run twice. I don't know why, but it just works.

bash text.sh "0.9.1" "v0.9.1-rc1"
bash csprng.sh "0.2.1" "v0.2.1"

# pip uninstall -y torchvision
# mv vision vision-built
# mv vision-bak vision || :
# export USE_FFMPEG=0
# bash vision.sh "0.9.1+slim" "v0.9.1"
