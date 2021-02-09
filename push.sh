#!/usr/bin/env bash

set -e

echo "$DOCKERPASS" | docker login -u "kumatea" --password-stdin

set -xe

docker push kumatea/build:py39-ci
docker push kumatea/build:py38-ci
docker push kumatea/build:py37-ci
docker push kumatea/build:py36-ci