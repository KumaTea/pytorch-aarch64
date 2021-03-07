#!/usr/bin/env bash

set -ex

wget -E -r -k -p "https://torch.maku.ml/"
cp -rf torch.maku.ml/* .
rm -rf torch.maku.ml
