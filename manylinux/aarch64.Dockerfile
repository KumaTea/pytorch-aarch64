FROM quay.io/pypa/manylinux_2_24_aarch64

RUN set -ex \
        \
        && echo "cd /root" >> /root/.bashrc \
        && apt update \
        && apt install -y ca-certificates \
        && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
        && sed -i 's@http://deb.debian.org/debian@https://mirrors.matrix.moe/debian@g' /etc/apt/sources.list \
        && sed -i 's@http://security.debian.org/debian-security@https://mirrors.matrix.moe/debian-security@g' /etc/apt/sources.list \
        && apt update \
        && apt install -y bash build-essential ca-certificates cmake curl git libffi-dev libssl-dev nano ninja-build wget xz-utils zlib1g-dev \
        && rm -rf /var/lib/apt/lists/* \
        && mv /etc/apt/sources.list.bak /etc/apt/sources.list

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
        && /opt/python/cp39-cp39/bin/python3.9 -m pip install -U cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/wheels.html \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp38-cp38/bin/python3.8 -m pip install -U cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/wheels.html \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp37-cp37m/bin/python3.7 -m pip install -U cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/wheels.html \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U pip setuptools wheel auditwheel \
        && /opt/python/cp36-cp36m/bin/python3.6 -m pip install -U cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/wheels.html \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

# COPY . .

CMD ["/bin/bash"]
