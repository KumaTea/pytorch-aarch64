#!/usr/bin/env bash

set -ex

PYVER=$1

sudo apt update
sudo apt install -y git software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
if [ "$PYVER" = "python3.10" ]; then
  sudo apt install -y $PYVER-dev $PYVER-distutils
else
  sudo apt install -y $PYVER-dev
fi

bash test/check-arch.sh
if [ "$PYVER" = "python3.10" ]; then
  wget https://bootstrap.pypa.io/get-pip.py
  $PYVER get-pip.py
fi

$PYVER -m pip install -U pip setuptools wheel
$PYVER -m pip install cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm  # -f https://ext.kmtea.eu/whl/stable.html
$PYVER -m pip install torch -f https://torch.kmtea.eu/whl/stable.html
$PYVER -m pip install torchvision torchaudio torchtext torchcsprng -f https://torch.kmtea.eu/whl/stable.html
$PYVER test/torch-test.py

mkdir -p /tmp/artifacts/whl
cp -a $(find /root/.cache/pip | grep whl | tr '\n' ' ') /tmp/artifacts/whl/ || echo "No new whl is built!"
