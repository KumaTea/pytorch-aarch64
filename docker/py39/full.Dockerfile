FROM python:3.9-slim

RUN set -ex \
        \
        && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
        && sed -i 's@http://deb.debian.org/debian@https://mirrors.matrix.moe/debian@g' /etc/apt/sources.list \
        && sed -i 's@http://security.debian.org/debian-security@https://mirrors.matrix.moe/debian-security@g' /etc/apt/sources.list \
        && apt update \
        && apt install -y bash ca-certificates libffi-dev libssl-dev xz-utils zlib1g-dev liblzma-dev libjpeg-dev libpng-dev \
        && rm -rf /var/lib/apt/lists/* \
        && mv /etc/apt/sources.list.bak /etc/apt/sources.list \
        && pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && python3 -m pip install -U pip setuptools wheel \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

RUN set -ex \
        \
        && pip config set global.index-url https://mirrors.matrix.moe/pypi/web/simple \
        && python3 -m pip install -U torch -f https://torch.maku.ml/whl/stable.html -f https://ext.maku.ml/wheels.html \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

RUN set -ex \
        \
        && if [ $(uname -m) = 'aarch64' ]; then cp /etc/apt/sources.list /etc/apt/sources.list.bak \
        && sed -i 's@http://deb.debian.org/debian@https://mirrors.matrix.moe/debian@g' /etc/apt/sources.list \
        && sed -i 's@http://security.debian.org/debian-security@https://mirrors.matrix.moe/debian-security@g' /etc/apt/sources.list \
        && apt update \
        && apt install -y ffmpeg \
        && rm -rf /var/lib/apt/lists/* \
        && mv /etc/apt/sources.list.bak /etc/apt/sources.list; else echo 'not aarch64'; fi \
        && python3 -m pip install -U torchvision torchtext torchcsprng -f https://torch.maku.ml/whl/stable.html -f https://ext.maku.ml/wheels.html \
        && rm -rf /root/.cache/*

CMD ["python3"]
