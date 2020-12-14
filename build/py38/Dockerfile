FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN set -xe \
        \
        && echo "cd /root" >> /root/.bashrc \
        && cd /root \
        && apt update \
        && apt install -y bash build-essential ca-certificates cmake curl git libssl-dev nano python3-cffi python3-dev python3-future python3-numpy python3-pil python3-pip python3-requests python3-setuptools python3-six python3-wheel python3-yaml screen xz-utils wget zlib1g-dev

RUN set -xe \
        \
        && python3 -m pip install -U dataclasses ninja pip pyyaml typing_extensions \
        && rm -rf /root/.cache/*

# COPY . .

CMD ["/bin/bash"]
