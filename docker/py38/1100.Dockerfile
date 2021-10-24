FROM python:3.8-slim

RUN set -ex \
        \
        && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
        && sed -i 's@http://deb.debian.org/debian@https://mirrors.ustc.edu.cn/debian@g' /etc/apt/sources.list \
        && sed -i 's@http://security.debian.org/debian-security@https://mirrors.ustc.edu.cn/debian-security@g' /etc/apt/sources.list \
        && apt update \
        && apt install -y bash ca-certificates libffi-dev libssl-dev xz-utils zlib1g-dev liblzma-dev \
        && rm -rf /var/lib/apt/lists/* \
        && mv /etc/apt/sources.list.bak /etc/apt/sources.list \
        && pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple \
        && python3 -m pip install -U pip setuptools wheel \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

RUN set -ex \
        \
        && pip config set global.index-url https://mirrors.ustc.edu.cn/pypi/web/simple \
        && python3 -m pip install numpy torch -f https://torch.kmtea.eu/whl/stable.html -f https://ext.kmtea.eu/whl/stable.html \
        && rm -rf /root/.cache/* \
        && rm -rf /root/.config/pip

CMD ["python3"]
