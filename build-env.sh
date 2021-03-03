#!/usr/bin/env bash

set -xe

docker buildx prune -f

cd py39
docker buildx build --pull --push --platform linux/arm64 -t kumatea/build:py39 -t kumatea/build:latest .
docker buildx prune -f
cd ..

cd py38
docker buildx build --pull --push --platform linux/arm64 -t kumatea/build:py38 .
docker buildx prune -f
cd ..

cd py37
docker buildx build --pull --push --platform linux/arm64 -t kumatea/build:py37 .
docker buildx prune -f
cd ..

cd py36
docker buildx build --pull --push --platform linux/arm64 -t kumatea/build:py36 .
docker buildx prune -f
cd ..

cd pypy37
docker buildx build --pull --push --platform linux/arm64 -t kumatea/build:pypy37 .
docker buildx prune -f
cd ..

cd pypy36
docker buildx build --pull --push --platform linux/arm64 -t kumatea/build:pypy36 .
docker buildx prune -f
cd ..
