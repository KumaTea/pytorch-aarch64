FROM python:3.8

RUN set -xe \
        \
        && python3.8 -m pip install -U pip setuptools wheel \
        && python3.8 -m pip install -U torch torchvision torchaudio torchtext -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

CMD ["python3"]
