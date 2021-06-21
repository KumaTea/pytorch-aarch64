#!/usr/bin/env bash

set -ex

pip install torch -f https://torch.kmtea.eu/whl/stable.html
# aarch64

pip install torchvision torchaudio torchtext torchcsprng -f https://torch.kmtea.eu/whl/stable.html
python3 test/torch-test.py
