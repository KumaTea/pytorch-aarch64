import torch
# import torchaudio
import torchvision
import torchtext
import torchcsprng


print(torch.__version__)
# print(torchaudio.__version__)
print(torchvision.__version__)
print(torchtext.__version__)
# print(torchcsprng.__version__)
torchcsprng.create_mt19937_generator(114514)
