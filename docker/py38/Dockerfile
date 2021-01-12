FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && echo "cd /root" >> /root/.bashrc \
        && apt update \
        && apt install -y bash build-essential ca-certificates curl libffi-dev libssl-dev nano wget xz-utils zlib1g-dev liblzma-dev libjpeg-dev libpng-dev sox libsox-dev\
        && rm -rf /var/lib/apt/lists/*

RUN set -xe \
        \
        && cd /root \
        && wget -q https://www.python.org/ftp/python/3.8.7/Python-3.8.7.tar.xz -O /root/py38.tar.xz \
        && tar -xJf /root/py38.tar.xz \
        && rm /root/py38.tar.xz \
        && cd /root/Python-3.8.7 \
        && ./configure \
        && make \
        && make install \
        && rm -rf /root/Python-3.8.7

RUN set -xe \
        \
        && python3.8 -m pip install -U pip setuptools wheel \
        && python3.8 -m pip install -U torch torchvision torchaudio torchtext -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

CMD ["python3"]