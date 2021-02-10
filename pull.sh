#!/usr/bin/env bash

set -xe

docker pull kumatea/build:py39-ci
docker pull kumatea/build:py38-ci
docker pull kumatea/build:py37-ci
docker pull kumatea/build:py36-ci
