#!/usr/bin/env bash

set -ex

wget -E -r -k -p "https://torch.maku.ml/"
cp -rf torch.maku.ml/* .
rm -rf torch.maku.ml

mkdir whl || :
wget "https://torch.maku.ml/whl/stable.html" -O whl/stable.html
wget "https://torch.maku.ml/whl/stable-cn.html" -O whl/stable-cn.html
