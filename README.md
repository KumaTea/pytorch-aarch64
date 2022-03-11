# pytorch-aarch64

[![Build Status][50]][51] [![Coverage][43]][16]

[PyTorch][20], [vision][21], [audio][22], [text][28] and [csprng][42]
wheels (whl) and docker images
for **`aarch64` / ARMv8 / ARM64** devices

[中文版](README_zh.md) ([for Gitee][31]) | [GitHub][32] | [Web][33] | [TF][55]

---

## Install

### [conda][58] 🆕 (WIP / Experimental)

**`conda install -c kumatea numpy pytorch`**

Also available:
  * `torchvision`

### pip

**`pip install torch -f https://torch.kmtea.eu/whl/stable.html`**

Add `torchvision`, `torchaudio`, `torchtext`, `torchcsprng` and other packages if needed.

Consider using [prebuilt wheels][57] to speed up installation:
`pip install torch -f https://torch.kmtea.eu/whl/stable.html -f https://ext.kmtea.eu/whl/stable.html`

(For users in China, please use [the CDN](README_zh.md#安装))

> Note: this command installs the latest version.
> For choosing a specific version, please check the [Custom Builds](#custom-builds) section.

To pick the `whl` files manually, please check the **[releases][16]**.

### [Docker][34] (deprecated)

**`docker run -it kumatea/pytorch`**

To pull the image, run `docker pull kumatea/pytorch`.

To check all available tags, [click here][34].

---

### [FastAI][27]

[FastAI][27] is a great [open-source][25] high-level deep learning framework based on PyTorch.

#### conda (recommended)

**`conda install -c fastai -c kumatea fastai`**

Similarly, `fastbook` could be installed by:

`conda install -c fastai -c kumatea fastbook`

#### pip

`pip install fastai -f https://torch.kmtea.eu/whl/stable.html`

`torch` and `torchvision` will be installed as dependencies automatically.

---

## Custom Builds

<details>
  <summary>click to view corresponding versions</summary>

| `torch` | `torchvision` | `torchaudio` | `torchtext` | `torchcsprng` | Status | `python` |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| `master` <br> `nightly` | `master` <br> `nightly` | `master` <br> `nightly` | `master` <br> `nightly` | `master` <br> `nightly` | | `>=3.6` |
| `1.10.0` | `0.11.1` <br> `0.11.0` | `0.10.0` | `0.11.0` | | [![passing][2]][56] | `>=3.6` |
| `1.9.1` | `0.10.1` | `0.9.1` | `0.10.1` | | | `>=3.6` |
| `1.9.0`<a href="#difference-from-the-official-wheels"><sup>[i]</sup></a> | `0.10.0` | `0.9.0` | `0.10.0` | | [![passing][2]][52] | `>=3.6` <a href="#about-python-310"><sup>[i]</sup></a> |
| `1.8.1` | `0.9.1` <a href="#about-torchvision-v091"><sup>[i]</sup></a> | `0.8.1` | `0.9.1` | `0.2.1` | [![passing][2]][48] | `>=3.6` |
| `1.8.0` <a href="#about-pytorch-v180"><sup>[i]</sup></a> | `0.9.0` | `0.8.0` | `0.9.0` | `0.2.0` | [![passing][2]][46] | `>=3.6` |
| `1.7.1` | `0.8.2` | `0.7.2` | `0.8.1` | `0.1.4` | [![passing][2]][18] | `>=3.6` |
| `1.7.0` | `0.8.1` <br> `0.8.0` | `0.7.0` | `0.8.0` | `0.1.3` | [![passing][2]][12] | `>=3.6` |
| `1.6.0` <a href="#about-pytorch-v160"><sup>[i]</sup></a> | `0.7.0` | `0.6.0` | `0.7.0` | `0.1.2` <br> `0.1.1` <br> `0.1.0` | [![passing][2]][10] | `>=3.6` |
| `1.5.1` | `0.6.1` | `0.5.1` | `0.6.0` | | [![passing][2]][35] | `>=3.5` |
| `1.5.0` | `0.6.0` | `0.5.0` | `0.6.0` | | [![passing][2]][36] | `>=3.5` |
| `1.4.1` <br> `1.4.0` | `0.5.0` | `0.4.0` | `0.5.0` | | [![passing][2]][37] | `==2.7`, `>=3.5`, `<=3.8` |
| `1.3.1` | `0.4.2` | | | | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.3.0` | `0.4.1` | | | | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.2.0` | `0.4.0` | | | | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.1.0` | `0.3.0` | | | | | `==2.7`, `>=3.5`, `<=3.7` |
| `<=1.0.1` | `0.2.2` | | | | | `==2.7`, `>=3.5`, `<=3.7` |

### Corresponding Versions
* [Corresponding `torch` and `torchvision` versions][13]
* [Corresponding `torch` and `torchaudio` versions][14]
* [Corresponding `torch` and `torchtext` versions][29]

</details>

---

## More Info

<details>
  <summary>click to expand...</summary>

### FAQ
  * **Q:** Does this run on Raspberry Pi?<br>**A: Yes**, if the architecture of the SoC is `aarch64`. It should run on all ARMv8 chips.<br> <br>
  * **Q:** Does this support CUDA / CUDNN?<br>**A: No**. [Check here](#cuda--cudnn-support) for more information.<br> <br>
  * **Q:** Does this run on Nvidia Jetson?<br>**A: Yes**, but extremely slow. Each Nvidia Jetson boards contains an Nvidia GPU, but this project only build cpu wheels. To better make use of your hardware, [build it yourself](build/torch.sh).<br> <br>

### Difference From The Official Wheels

In most circumstances, it's **recommended to just use the official** wheels,
and it will also be installed via pip by default, even with `-f`.

The wheels here are compiled from source on a rpi 4b+,
and are for codes that crashed on official wheels,
because of some unsupported instructions are used.

Use the `torch` wheels here **only if you encounter problems** like [#8][53].

### About Python 3.10

By the time this change (v1.9.0) is committed, NONE of the stable version of
Python 3.10.0,
Numpy 1.21.0 (which adds Python 3.10 support), or
PyTorch 1.9.0 for Python 3.10 has been released.

If any critical issue is found, I may rebuild the wheel after stable releases.

### About PyTorch v1.8.0

* Starting from v1.8.0, the **official** wheels of PyTorch for `aarch64` has finally released!
  * ~~To use the official wheels, use this index link: <br> **`https://torch.kmtea.eu/whl/pfml.html`** <br> where `pfml` stands for `prefer-manylinux` here.~~ <br> `manylinux` wheels will be installed by default.
* `torchvision` wheels are built with [FFmpeg][47] support. For wheels without it, please install `torchvision==0.9.0+slim`

### About PyTorch v1.6.0

A fatal bug is encountered and [this patch][24] is applied while building PyTorch v1.6.0.
The patch has been merged into mainstream in later versions.

### About `torchvision` v0.9.1

Starting from `torchvision` v0.9.1,
`manylinux` wheels are officially provided via both [its indexes][49] and PyPI.
However, since they do not contain necessary backends (< 1MB) and may require extra installations,
this project will continue to build `torchvision` wheels.

### `RuntimeError` while importing

If you see something like this when `import torch`:

`RuntimeError: module compiled against API version 0xe but this version of numpy is 0xd`

Please upgrade your `numpy` version: `pip install -U numpy`.

### CUDA / CUDNN Support

Since the building environment (as below) does not contain an Nvidia GPU,
the wheels could not be built with cuda support.

If you need it, please use an [Nvidia Jetson][30] board to run the [building code](build/torch.sh).

### Building Environment

> Host: Raspberry Pi 4 Model B
> 
> SoC: BCM2711 (quad-core A53)
> 
> Architecture: ARMv8 / ARM64 / `aarch64`
> 
> OS: Debian Buster
> 
> GCC: v8.3.0
> 
> Virtualization: **Docker**

### Performance

Test date: 2021-10-29

Script: [bench.py](test/bench.py)

> Less execution time is better

| Platform | Specs | Training | Prediction | Version |
| :---: | :---: | :---: | :---: | :---: |
| `aarch64` | BCM2711 (4x Cortex-A72) | 1:48:44 | 11,506.080 ms | `1.10.0` <br> `3.9.7` |
| `aarch64` | QUALCOMM Snapdragon 845 | N/A | 4,821.148 ms (24x) | `1.10.0` <br> `3.9.7` |
| `amd64` | INTEL Core i5-6267U | 162.964 s | 140.680 ms (82x) | `1.10.0+cpu` <br> `3.9.7` |
| Google Colab | INTEL Xeon ??? <br> NVIDIA Tesla K80 | 6.400 s | 70.714 ms (163x) | `1.10.0+cu113` <br> `3.7.12` |
| Kaggle | INTEL Xeon ??? <br> NVIDIA Tesla P100 | 6.626 s | 33.878 ms (340x) | `1.10.0+cu113` <br>`3.7.10` |

Note:
1. This test was done by using a same _Cat or Dog_ model, to predict 10 random animal images (while same for each group).
2. The latest version of PyTorch was manually installed on all platforms, but driver and Python remained default.

</details>


[1]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.4.0
[2]: https://img.shields.io/badge/build-passing-brightgreen
[3]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.5.0
[4]: https://img.shields.io/badge/build-pending-yellow
[5]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.6.0
[6]: https://img.shields.io/badge/build-running-blue
[7]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py36
[8]: https://img.shields.io/badge/build-failed-red
[9]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py37
[10]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.6.0
[11]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py38
[12]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.7.0
[13]: https://github.com/pytorch/vision#installation
[14]: https://github.com/pytorch/audio#dependencies
[15]: https://img.shields.io/badge/build-canceled-lightgrey
[16]: https://github.com/KumaTea/pytorch-aarch64/releases
[17]: https://pypi.org/project/torchtext/0.6.0/#files
[18]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.7.1
[19]: https://status.openlabtesting.org/builds/builds?project=pytorch%2Fpytorch
[20]: https://github.com/pytorch/pytorch
[21]: https://github.com/pytorch/vision
[22]: https://github.com/pytorch/audio
[23]: https://linux-sunxi.org/H6
[24]: https://github.com/pytorch/pytorch/issues/33124#issuecomment-602048845
[25]: https://github.com/fastai/fastai
[26]: https://www.anaconda.com/products/individual
[27]: https://www.fast.ai
[28]: https://github.com/pytorch/text
[29]: https://github.com/pytorch/text#installation
[30]: https://developer.nvidia.com/embedded/jetson-developer-kits
[31]: https://gitee.com/kumatea/pytorch-aarch64
[32]: https://github.com/KumaTea/pytorch-aarch64
[33]: https://torch.kmtea.eu
[34]: https://hub.docker.com/r/kumatea/pytorch
[35]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.5.1
[36]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.5.0
[37]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.4.1
[38]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.4.0
[39]: https://github.com/KumaTea/pytorch-aarch64#official-pytorch-ci-builds
[40]: https://travis-ci.org/KumaTea/pytorch-aarch64.svg?branch=main
[41]: https://travis-ci.org/KumaTea/pytorch-aarch64
[42]: https://github.com/pytorch/csprng
[43]: https://shields.io/badge/python-3.6%20%7C%203.7%20%7C%203.8%20%7C%203.9%20%7C%203.10-blue
[44]: https://shields.io/badge/ARM-v7%20%7C%20v8-blue
[45]: https://github.com/KumaTea/pytorch-arm
[46]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.8.0
[47]: https://www.ffmpeg.org
[48]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.8.1
[49]: https://download.pytorch.org/whl/torch_stable.html
[50]: https://circleci.com/gh/KumaTea/pytorch-aarch64.svg?style=svg
[51]: https://circleci.com/gh/KumaTea/pytorch-aarch64
[52]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.9.0
[53]: https://github.com/KumaTea/pytorch-aarch64/issues/8
[54]: https://github.com/conda-forge/miniforge
[55]: https://github.com/KumaTea/tensorflow-aarch64
[56]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.10.0
[57]: https://github.com/KumaTea/ext-whl
[58]: https://anaconda.org/kumatea/pytorch
