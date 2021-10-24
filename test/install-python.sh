#!/usr/bin/env bash

set -ex

PYVER=$1

sudo apt install -y -qq build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

cd /tmp || mkdir /tmp && cd /tmp
mkdir pysrc && cd pysrc

wget "https://www.python.org/ftp/python/$PYVER/Python-$PYVER.tar.xz"
tar -xJf "Python-$PYVER.tar.xz"

cd "Python-$PYVER"
./configure > /dev/null  # do not use --enable-optimizations
make -j$(nproc) > /dev/null
make altinstall > /dev/null

echo "Python $PYVER installation: done."
