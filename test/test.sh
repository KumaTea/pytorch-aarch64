#!/usr/bin/env bash

set -ex

PYVER=$1

sudo apt update

if [ "$PYVER" = "python3.10" ]; then
  sudo apt install -y -qq wget
  sudo bash test/install-python.sh 3.10.0
else
  sudo apt install -y -qq software-properties-common
  sudo add-apt-repository -y ppa:deadsnakes/ppa
  sudo apt install -y -qq $PYVER-dev
fi

bash test/check-arch.sh

$PYVER -m pip install -Uq pip setuptools wheel
$PYVER -m pip install -q cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm  # -f https://ext.kmtea.eu/whl/stable.html
$PYVER -m pip install -q torch -f https://torch.kmtea.eu/whl/stable.html
$PYVER -m pip install -q torchvision torchaudio torchtext torchcsprng -f https://torch.kmtea.eu/whl/stable.html
$PYVER test/torch-test.py

mkdir -p /tmp/artifacts/whl
cp -a $(find /root/.cache/pip | grep whl | tr '\n' ' ') /tmp/artifacts/whl/ || echo "No new whl is built!"
