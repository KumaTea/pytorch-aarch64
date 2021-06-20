FROM python:3.8

RUN set -ex \
        \
        && echo "cd /root" >> /root/.bashrc \
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
        && pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && python3 -m pip install -U pip setuptools wheel \
        && python3 -m pip install -U cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/wheels.html \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

# COPY . .

CMD ["/bin/bash"]
