#!/usr/bin/env bash

set -xe

PYVER=$1

cd docker
cd "py$PYVER"

if [ "$PYVER" == "39" ]; then
    docker build -t kumatea/pytorch:1.7.1 -t "kumatea/pytorch:1.7.1-py$PYVER" -t "kumatea/pytorch:$PYVER" -f Dockerfile .
else
    docker build -t "kumatea/pytorch:1.7.1-py$PYVER" -t "kumatea/pytorch:$PYVER" -f Dockerfile .
fi

if [ "$PYVER" == "39" ]; then
    docker build -t kumatea/pytorch:latest kumatea/pytorch:1.7.1-full -t "kumatea/pytorch:1.7.1-py$PYVER-full" -t "kumatea/pytorch:$PYVER-full" -f full.Dockerfile .
else
    docker build -t "kumatea/pytorch:1.7.1-py$PYVER-full" -t "kumatea/pytorch:$PYVER-full" -f full.Dockerfile .
fi
