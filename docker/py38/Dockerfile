FROM python:3.8-slim

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && apt update \
        && apt install -y bash ca-certificates libffi-dev libssl-dev xz-utils zlib1g-dev liblzma-dev libjpeg-dev libpng-dev sox libsox-dev \
        && rm -rf /var/lib/apt/lists/*

RUN set -xe \
        \
        && python3.8 -m pip install -U pip setuptools wheel \
        && python3.8 -m pip install -U torch torchvision torchaudio torchtext -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

CMD ["python3"]
