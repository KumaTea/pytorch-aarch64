set -xe

echo "Building PyTorch"


export CC=/opt/rh/devtoolset-8/root/usr/bin/gcc
export GCC=/opt/rh/devtoolset-8/root/usr/bin/gcc
export CPP=/opt/rh/devtoolset-8/root/usr/bin/cpp  # not g++
export CXX=/opt/rh/devtoolset-8/root/usr/bin/g++
