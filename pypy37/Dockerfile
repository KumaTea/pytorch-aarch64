FROM pypy:3.7

RUN set -ex \
        \
        && echo "cd /root" >> /root/.bashrc \
        && apt update \
        && apt install -y bash build-essential ca-certificates cmake curl git libffi-dev libssl-dev nano ninja-build wget xz-utils zlib1g-dev \
        && rm -rf /var/lib/apt/lists/*

RUN set -ex \
        \
        && cd /root \
        && wget http://ffmpeg.org/releases/ffmpeg-4.3.2.tar.xz \
        && tar -xJf ffmpeg-4.3.2.tar.xz \
        && cd ffmpeg-4.3.2 \
        && ./configure \
        && make \
        && make install \
        && cd /root \
        && rm -rf ffmpeg-4.3.2 ffmpeg-4.3.2.tar.xz

RUN set -ex \
        \
        && pypy3 -m pip install -U pip setuptools wheel \
        && pypy3 -m pip install -U cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm -f https://ext.maku.ml/wheels.html \
        && rm -rf /root/.cache/*

# COPY . .

CMD ["/bin/bash"]
