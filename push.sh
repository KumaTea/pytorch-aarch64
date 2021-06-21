#!/usr/bin/env bash

set -xe

PYVER=$1

if [ "$PYVER" == "39" ]; then
    docker push kumatea/pytorch:1.9.0
    docker push kumatea/pytorch:1.9.0-full
    docker push kumatea/pytorch:latest
fi

docker push "kumatea/pytorch:1.9.0-py$PYVER"
docker push "kumatea/pytorch:py$PYVER"
docker push "kumatea/pytorch:1.9.0-py$PYVER-full"
docker push "kumatea/pytorch:py$PYVER-full"
