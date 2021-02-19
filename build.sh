#!/usr/bin/env bash

set -xe

PYVER=$1

cd docker
cd "py$PYVER"

if [ "$PYVER" == "39" ]; then
    docker build -t kumatea/pytorch:1.7.1 -t "kumatea/pytorch:1.7.1-py$PYVER" -t "kumatea/pytorch:py$PYVER" .
else
    docker build -t "kumatea/pytorch:1.7.1-py$PYVER" -t "kumatea/pytorch:py$PYVER" .
fi

if [ "$PYVER" == "39" ]; then
    docker build -f full.Dockerfile -t kumatea/pytorch:latest .
    docker build -f full.Dockerfile -t kumatea/pytorch:1.7.1-full .
fi

docker build -f full.Dockerfile -t "kumatea/pytorch:1.7.1-py$PYVER-full" .
docker build -f full.Dockerfile -t "kumatea/pytorch:py$PYVER-full" .
