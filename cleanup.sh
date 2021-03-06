#!/usr/bin/env bash

set -xe

docker rmi "$(docker images --filter dangling=true -q --no-trunc)" || :
# https://stackoverflow.com/questions/32723111
