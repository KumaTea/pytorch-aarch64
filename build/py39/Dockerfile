FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && echo "cd /root" >> /root/.bashrc \
        && cd /root \
        && apt update \
        && apt install -y bash build-essential ca-certificates cmake curl git libffi-dev libssl-dev nano screen wget xz-utils zlib1g-dev \
        && wget -q https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tar.xz -O /root/py39.tar.xz \
        && tar -xJf /root/py39.tar.xz \
        && rm /root/py39.tar.xz \
        && cd /root/Python-3.9.1 \
        && ./configure \
        && make \
        && make install \
        && cd /root \
        && rm -rf /root/Python-3.9.1 \
        && python3.9 -m pip install -U pip setuptools wheel \
        && python3.9 -m pip install -U cffi dataclasses future ninja numpy pillow pyyaml requests six typing_extensions \
        && rm -rf /root/.cache/*

# COPY . .

CMD ["/bin/bash"]
