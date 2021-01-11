FROM python:3.7

RUN set -xe \
        \
        && python3.7 -m pip install -U pip setuptools wheel \
        && python3.7 -m pip install -U torch torchvision torchaudio torchtext -f https://torch.maku.ml/whl/stable.html \
        && rm -rf /root/.cache/*

CMD ["python3"]
