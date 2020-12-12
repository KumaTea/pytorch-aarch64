FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive
# tzdata

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ./buster.list /etc/apt/sources.list

RUN set -xe \
        \
        && apt update \
        && apt install -y bash ca-certificates cmake curl git libssl-dev nano python3-cffi python3-dev python3-future python3-numpy python3-pil python3-pip python3-requests python3-setuptools python3-six python3-wheel python3-yaml screen wget \
        && python3 -m pip install -U dataclasses pip typing_extensions

RUN mv /etc/apt/sources.list.bak /etc/apt/sources.list
# Reset sources.list to default

COPY . .

CMD ["/bin/bash"]
