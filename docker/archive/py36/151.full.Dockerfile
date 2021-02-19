FROM python:3.6-slim

RUN set -xe \
        \
        && apt update \
        && apt install -y bash ca-certificates libffi-dev libssl-dev xz-utils zlib1g-dev liblzma-dev libjpeg-dev libpng-dev sox libsox-dev \
        && rm -rf /var/lib/apt/lists/*
        && python3 -m pip install -U pip setuptools wheel \
        && rm -rf /root/.cache/*

RUN set -xe \
        \
        && python3 -m pip install -U torch==1.5.1 -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

RUN set -xe \
        \
        && python3 -m pip install -U torchvision==0.6.1 torchaudio==0.5.1 torchtext==0.6.0 -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

CMD ["python3"]
