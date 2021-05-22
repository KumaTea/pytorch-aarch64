#!/usr/bin/env bash

set -ex

pip install torch===1.8.1 -f https://torch.kmtea.eu/whl/stable.html
# aarch64

pip install torchvision===0.9.1 torchaudio torchtext torchcsprng -f https://torch.kmtea.eu/whl/stable.html
python3 test/torch-test.py

pip uninstall -y torch torchvision
pip install torch torchvision -f https://torch.kmtea.eu/whl/stable.html
python3 test/torch-test.py
