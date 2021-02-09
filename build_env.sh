#!/usr/bin/env bash

set -xe

cd py39
docker build --pull -t kumatea/build:py39-ci .
cd ..

cd py38
docker build --pull -t kumatea/build:py38-ci .
cd ..

cd py37
docker build --pull -t kumatea/build:py37-ci .
cd ..

cd py36
docker build --pull -t kumatea/build:py36-ci .
cd ..


