FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && echo "cd /root" >> /root/.bashrc \
        && apt update \
        && apt install -y bash build-essential ca-certificates cmake curl git libffi-dev libssl-dev nano wget xz-utils zlib1g-dev \
        && rm -rf /var/lib/apt/lists/*

RUN set -xe \
        \
        && cd /root \
        && wget -q https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tar.xz -O /root/py37.tar.xz \
        && tar -xJf /root/py37.tar.xz \
        && rm /root/py37.tar.xz \
        && cd /root/Python-3.7.9 \
        && ./configure \
        && make \
        && make install \
        && rm -rf /root/Python-3.7.9

RUN set -xe \
        \
        && python3.7 -m pip install -U pip setuptools wheel \
        && python3.7 -m pip install -U cffi dataclasses future ninja numpy pillow pyyaml requests six typing_extensions \
        && rm -rf /root/.cache/*

# COPY . .

CMD ["/bin/bash"]
