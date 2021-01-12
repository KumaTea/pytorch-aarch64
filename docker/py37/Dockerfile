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
        && python3.7 -m pip install -U torch torchvision torchaudio torchtext -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

CMD ["python3"]