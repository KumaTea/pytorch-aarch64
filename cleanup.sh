#!/usr/bin/env bash

set -xe

docker rmi kumatea/build:py39-ci
docker rmi kumatea/build:py38-ci
docker rmi kumatea/build:py37-ci
docker rmi kumatea/build:py36-ci
