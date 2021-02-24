#!/usr/bin/env bash

set -xe

cd py39
docker build --pull -t kumatea/build:py39 -t kumatea/build:latest .
cd ..

cd py38
docker build --pull -t kumatea/build:py38 .
cd ..

cd py37
docker build --pull -t kumatea/build:py37 .
cd ..

cd py36
docker build --pull -t kumatea/build:py36 .
cd ..

cd pypy37
docker build --pull -t kumatea/build:pypy37 .
cd ..

cd pypy36
docker build --pull -t kumatea/build:pypy36 .
cd ..

