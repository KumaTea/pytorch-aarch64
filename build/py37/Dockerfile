FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && echo "cd /root" >> /root/.bashrc \
        && cd /root \
        && apt update \
        && apt install -y bash build-essential ca-certificates cmake curl git libffi-dev libssl-dev nano screen wget xz-utils zlib1g-dev \
        && wget -q https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tar.xz -O /root/py37.tar.xz \
        && tar -xJf /root/py37.tar.xz \
        && rm /root/py37.tar.xz \
        && cd /root/Python-3.7.9 \
        && ./configure \
        && make \
        && make install \
        && cd /root \
        && rm -rf /root/Python-3.7.9 \
        && python3.7 -m pip install -U pip setuptools wheel \
        && python3.7 -m pip install -U cffi dataclasses future numpy pillow requests six typing_extensions \
        && rm -rf /root/.cache/*

# COPY . .

CMD ["/bin/bash"]
