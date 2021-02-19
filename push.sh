#!/usr/bin/env bash

set -e

echo "$DOCKERPASS" | docker login -u "kumatea" --password-stdin

set -xe

PYVER=$1

cd docker
cd "py$PYVER"

if [ "$PYVER" == "39" ]; then
    docker push kumatea/pytorch:1.7.1
    docker push kumatea/pytorch:1.7.1-full
    docker push kumatea/pytorch:latest
fi

docker push "kumatea/pytorch:1.7.1-py$PYVER"
docker push "kumatea/pytorch:$PYVER"
docker push "kumatea/pytorch:1.7.1-py$PYVER-full"
docker push "kumatea/pytorch:$PYVER-full"
