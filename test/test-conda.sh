#!/usr/bin/env bash

set -ex

# sudo apt update
# sudo apt install -y -qq wget

# bash test/check-arch.sh

wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh -O /tmp/install-conda.sh
bash /tmp/install-conda.sh -b -p /tmp/conda

CONDA_EXE=/tmp/conda/bin/conda
$CONDA_EXE init bash
source /home/circleci/.bashrc

# Create a conda environment
$CONDA_EXE create -n test python=$PYVER -y
conda activate test

# Install packages
PKGS="pytorch numpy cpuonly"
CONDA_TEST_PYTHON=/tmp/conda/envs/test/bin/python

conda install $PKGS -c kumatea -y
$CONDA_TEST_PYTHON test/torch-test.py
