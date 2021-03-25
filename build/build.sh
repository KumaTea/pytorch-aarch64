set -xe

echo "Building PyTorch"

bash deps.sh

bash torch.sh "1.8.1" "v1.8.1"
bash vision.sh "0.9.1" "v0.9.1"
bash audio.sh "0.8.1" "v0.8.1"
bash text.sh "0.9.1" "v0.9.1-rc1"
bash csprng.sh "0.2.1" "v0.2.1"
