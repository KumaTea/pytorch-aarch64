FROM quay.io/pypa/manylinux2014_aarch64

RUN set -ex \
        \
        && echo "cd /root" >> /root/.bashrc \
        && yum install -y dnf \
        && dnf install -y epel-release \
        && dnf install -y autogen bash ca-certificates centos-release-scl cmake curl devtoolset-8 gettext git libffi-devel openssl-devel nano ninja-build wget xz zlib-devel \
        && dnf clean all \
        && yum clean all \
        && rm -rf /var/cache/dnf \
        && rm -rf /var/cache/yum

RUN set -ex \
        \
        && if [ $(uname -m) = 'aarch64' ]; then cd /root \
        && wget http://ffmpeg.org/releases/ffmpeg-4.3.2.tar.xz \
        && tar -xJf ffmpeg-4.3.2.tar.xz \
        && cd ffmpeg-4.3.2 \
        && ./configure --enable-shared \
        && make -j$(nproc) \
        && make install \
        && cd /root \
        && rm -rf ffmpeg-4.3.2 ffmpeg-4.3.2.tar.xz; fi

RUN set -ex \
        \
        && /opt/python/cp39-cp39/bin/pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U cffi dataclasses future "numpy~=1.19.2" pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U cffi dataclasses future "numpy~=1.19.2" pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U cffi dataclasses future "numpy~=1.19.2" pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U cffi dataclasses future "numpy~=1.19.2" pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

COPY custom.bashrc /root/

RUN set -ex \
        \
        && ln -s /usr/bin/ninja-build /usr/bin/ninja \
        && cat /root/custom.bashrc >> /root/.bashrc

CMD ["/bin/bash"]
