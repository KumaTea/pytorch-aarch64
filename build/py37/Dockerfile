FROM python:3.7

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && echo "cd /root" >> /root/.bashrc \
        && apt update \
        && apt install -y bash build-essential ca-certificates cmake curl git libffi-dev libssl-dev nano ninja-build wget xz-utils zlib1g-dev \
        && rm -rf /var/lib/apt/lists/*

RUN set -xe \
        \
        && python3.7 -m pip install -U pip setuptools wheel \
        && python3.7 -m pip install -U cffi dataclasses future numpy pillow pyyaml requests six typing_extensions tqdm\
        && rm -rf /root/.cache/*

# COPY . .

CMD ["/bin/bash"]
