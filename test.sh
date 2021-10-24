#!/usr/bin/env bash

set -xe

PYVER=$1

docker run --rm "kumatea/pytorch:1.10.0-py$PYVER" python3 -c "import torch; print(torch.__version__)"

docker run --rm "kumatea/pytorch:1.10.0-py$PYVER-full" python3 -c "import torch, torchaudio, torchvision, torchtext, torchcsprng; print(torch.__version__, torchaudio.__version__, torchvision.__version__, torchtext.__version__, torchcsprng.__version__)"
