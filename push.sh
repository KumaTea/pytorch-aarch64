#!/usr/bin/env bash

set -xe

docker push kumatea/build:py39
docker push kumatea/build:latest
docker push kumatea/build:py38
docker push kumatea/build:py37
docker push kumatea/build:py36

