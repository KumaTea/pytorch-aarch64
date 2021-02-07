FROM python:3.7-slim

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && apt update \
        && apt install -y bash ca-certificates libffi-dev libssl-dev xz-utils zlib1g-dev liblzma-dev libjpeg-dev libpng-dev sox libsox-dev \
        && rm -rf /var/lib/apt/lists/*

RUN set -xe \
        \
        && python3.7 -m pip install -U pip setuptools wheel \
        && python3.7 -m pip install -U torch==1.7.0 torchvision==0.8.1 torchaudio==0.7.0 torchtext==0.8.0 -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

CMD ["python3"]
