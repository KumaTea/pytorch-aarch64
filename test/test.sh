#!/usr/bin/env bash

set -ex

pip install torch torchvision==0.9.1 torchaudio torchtext torchcsprng -f https://torch.maku.ml/whl/stable.html
python3 test/torch-test.py

pip uninstall -y torchvision
pip install torchvision==0.9.1+slim -f https://torch.maku.ml/whl/stable.html
python3 test/torch-test.py
