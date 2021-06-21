FROM python:3.10-rc-slim

RUN set -ex \
        \
        && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
        && sed -i 's@http://deb.debian.org/debian@https://mirrors.matrix.moe/debian@g' /etc/apt/sources.list \
        && sed -i 's@http://security.debian.org/debian-security@https://mirrors.matrix.moe/debian-security@g' /etc/apt/sources.list \
        && apt update \
        && apt install -y bash ca-certificates libffi-dev libssl-dev xz-utils zlib1g-dev liblzma-dev \
        && rm -rf /var/lib/apt/lists/* \
        && mv /etc/apt/sources.list.bak /etc/apt/sources.list \
        && pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && python3 -m pip install -U pip setuptools wheel \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

RUN set -ex \
        \
        && pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && python3 -m pip install "numpy>1.20" torch -f https://torch.kmtea.eu/whl/stable.html -f https://ext.kmtea.eu/whl/stable.html \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

RUN set -ex \
        \
        && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
        && sed -i 's@http://deb.debian.org/debian@https://mirrors.matrix.moe/debian@g' /etc/apt/sources.list \
        && sed -i 's@http://security.debian.org/debian-security@https://mirrors.matrix.moe/debian-security@g' /etc/apt/sources.list \
        && apt update \
        && apt install -y libjpeg-dev libpng-dev \
        && rm -rf /var/lib/apt/lists/* \
        && mv /etc/apt/sources.list.bak /etc/apt/sources.list \
        && pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && python3 -m pip install Pillow -f https://ext.kmtea.eu/whl/stable.html \
        && python3 -m pip install https://github.com/KumaTea/pytorch-aarch64/releases/download/v1.9.0/torchvision-0.10.0-cp310-cp310-manylinux2014_aarch64.whl \
        && python3 -m pip install torchaudio torchtext -f https://torch.kmtea.eu/whl/stable.html -f https://ext.kmtea.eu/whl/stable.html \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

CMD ["python3"]
