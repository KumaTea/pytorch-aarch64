FROM python:3.9-slim

RUN set -xe \
        \
        && apt update \
        && apt install -y bash ca-certificates libffi-dev libssl-dev xz-utils zlib1g-dev liblzma-dev libjpeg-dev libpng-dev sox libsox-dev \
        && rm -rf /var/lib/apt/lists/* \
        && python3 -m pip install -U pip setuptools wheel \
        && rm -rf /root/.cache/*

RUN set -xe \
        \
        && python3 -m pip install -U torch -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

RUN set -xe \
        \
        && python3 -m pip install -U torchvision torchaudio torchtext torchcsprng -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

CMD ["python3"]
