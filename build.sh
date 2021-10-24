#!/usr/bin/env bash

set -xe

PYVER=$1

cd docker
cd "py$PYVER"

if [ "$PYVER" == "39" ]; then
  docker build -f 1100.Dockerfile -t kumatea/pytorch:1.10.0 -t "kumatea/pytorch:1.10.0-py$PYVER" -t "kumatea/pytorch:py$PYVER" -t kumatea/pytorch:latest .
else
  docker build -f 1100.Dockerfile -t "kumatea/pytorch:1.10.0-py$PYVER" -t "kumatea/pytorch:py$PYVER" .
fi

if [ "$PYVER" == "39" ]; then
  docker build -f 1100.full.Dockerfile -t kumatea/pytorch:1.10.0-full -t "kumatea/pytorch:1.10.0-py$PYVER-full" -t "kumatea/pytorch:py$PYVER-full" .
else
  docker build -f 1100.full.Dockerfile -t "kumatea/pytorch:1.10.0-py$PYVER-full" -t "kumatea/pytorch:py$PYVER-full" .
fi
