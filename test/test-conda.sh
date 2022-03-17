#!/usr/bin/env bash

set -ex

PYVER=$1

bash test/check-arch.sh

wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O /tmp/install-conda.sh
bash /tmp/install-conda.sh -b -p /tmp/conda

CONDA_EXE=/tmp/conda/bin/conda
$CONDA_EXE init bash
source /home/circleci/.bashrc > /dev/null

# Create a conda environment
$CONDA_EXE create -n test python=$PYVER -y
conda activate test > /dev/null

# Install packages
PKGS="torchvision>=0.12"
CONDA_TEST_PYTHON=/tmp/conda/envs/test/bin/python

conda install $PKGS -c kumatea -y
$CONDA_TEST_PYTHON test/torch-test.py
