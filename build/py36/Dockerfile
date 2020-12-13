FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && echo "cd /root" >> /root/.bashrc \
        && cd /root \
        && apt update \
        && apt install -y bash build-essential ca-certificates cmake curl git libjpeg-dev libpng-dev libssl-dev nano screen wget xz-utils zlib1g-dev \
        && wget -q https://www.python.org/ftp/python/3.6.12/Python-3.6.12.tar.xz -O /root/py36.tar.xz \
        && tar -xJf /root/py36.tar.xz \
        && rm /root/py36.tar.xz \
        && cd /root/Python-3.6.12 \
        && ./configure \
        && make \
        && make install \
        && cd /root \
        && rm -rf /root/Python-3.6.12 \
        && python3.6 -m pip install -U pip setuptools wheel \
        && python3.6 -m pip install -U dataclasses future ninja numpy pillow pyyaml requests six typing_extensions \
        && rm -rf /root/.cache/*

# COPY . .

CMD ["/bin/bash"]
