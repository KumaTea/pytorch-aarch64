#!/usr/bin/env bash

set -ex

wget -E -r -k -p "https://torch.kmtea.eu/"
cp -rf torch.kmtea.eu/* .
rm -rf torch.kmtea.eu

mkdir whl || :
wget "https://torch.kmtea.eu/whl/stable.html" -O whl/stable.html
wget "https://torch.kmtea.eu/whl/stable-cn.html" -O whl/stable-cn.html
