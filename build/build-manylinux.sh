# Build using official manylinux wheels

set -xe

echo "Building PyTorch"

bash deps.sh

# bash torch.sh "1.8.0" "v1.8.0"
pip install -U torch -f https://ext.maku.ml/wheels.html
bash vision.sh "0.9.0" "v0.9.0"
bash text.sh "0.9.0" "v0.9.0-rc5"
bash csprng.sh "0.2.0" "v0.2.0"

bash audio.sh "0.8.0" "v0.8.0"
