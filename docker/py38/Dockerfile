FROM python:3.8-slim

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

CMD ["python3"]
