# pytorch-aarch64
[PyTorch][20], [torchvision][21], [torchaudio][22] and [torchtext][28] wheels (whl) for aarch64 / ARMv8 / ARM64 devices

[中文版](README_zh.md) ([for Gitee][31]) | [GitHub][32] | [Web][33]

## Install

Run:

**`pip install torch -f https://torch.maku.ml/whl/stable.html`**

Add `torchvision`, `torchaudio`, `torchtext` and other packages if you need.

Note: this command installs the latest version.
For choosing a specific version, please check the [Corresponding Versions](#corresponding-versions) section.

To pick the `whl` files manually, check the **[releases][16]**.

## Docker

**`docker run -it kumatea/pytorch`**

To pull the image, run `docker pull kumatea/pytorch`.

To check all available tags, [ckick here][34].

> TODO: add `readline` support

### [FastAI][27]

[FastAI][27] is a great [open-source][25] high-level deep learning framework based on PyTorch.
It recommends installing by `conda`, but there is no [Anaconda][26] builds for `aarch64`.
So, install `fastai` by:

`pip install fastai -f https://torch.maku.ml/whl/stable.html`

`torch` and `torchvision` will be installed as dependencies automatically.

Similarly, `fastbook` could be installed by:

`pip install fastbook -f https://torch.maku.ml/whl/stable.html`

## Custom Builds

### PyTorch

| py / ver | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: |
| 1.8.0 | | | | |
| 1.7.1 | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] |
| 1.7.0 | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] |
| 1.6.0 <a href="#about-pytorch-v160"><sup>[i]</sup></a> | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] |
| <= 1.5.0 | ![canceled][15] | ![canceled][15] | ![canceled][15] | ![canceled][15] |

### `torchvision`
* All wheels will be built with the [Corresponding `torch` Versions](#corresponding-versions).

| ver | `torch` | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 0.8.2 | 1.7.1 | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] |
| 0.8.0 / 0.8.1 | 1.7.0 | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] |
| 0.7.0 | 1.6.0 | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] |
| <= 0.6.1 | <= 1.5.0 | ![canceled][15] | ![canceled][15] | ![canceled][15] | ![canceled][15] |

### `torchaudio`
* All wheels will be built with the [Corresponding `torch` Versions](#corresponding-versions).

| ver | `torch` | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 0.7.2 | 1.7.1 | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] |
| 0.7.0 | 1.7.0 | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] |
| 0.6.0 | 1.6.0 | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] |
| <= 0.5.1 | <= 1.5.0 | ![canceled][15] | ![canceled][15] | ![canceled][15] | ![canceled][15] |

### `torchtext` <a href="#about-torchtext"><sup>[i]</sup></a>
* All wheels will be built with the [Corresponding `torch` Versions](#corresponding-versions).

| ver | `torch` | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 0.8.1 | 1.7.1 | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] |
| 0.8.0 | 1.7.0 | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] |
| 0.7.0 | 1.6.0 | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] |
| <= 0.6.0 | <= 1.5.0 | ![canceled][15] | ![canceled][15] | ![canceled][15] | ![canceled][15] |

## Official PyTorch CI Builds

| py / ver | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: |
| master | [![Build Status][7]][19] | [![Build Status][9]][19] | [![Build Status][11]][19] | |
| 1.8.0 | | | | |
| 1.7.1 | | | | |
| 1.7.0 | | | | |
| 1.6.0 | [![Build Status][5]][19] | | | |
| 1.5.0 | [![Build Status][3]][19] | | | |
| 1.4.0 | [![Build Status][1]][19] | | | |

---

### Corresponding Versions
* [Corresponding `torch` and `torchvision` versions][13]
* [Corresponding `torch` and `torchaudio` versions][14]
* [Corresponding `torch` and `torchtext` versions][29]

| `torch` | `torchvision` | `torchaudio` | `torchtext` | `python` |
| :---: | :---: | :---: | :---: | :---: |
| `master` / `nightly` | `master` / `nightly` | `master` / `nightly` | `master` / `nightly` | `>=3.6` |
| `1.7.1` | `0.8.2` | `0.7.2` | `0.8.1` | `>=3.6` |
| `1.7.0` | `0.8.0` / `0.8.1` | `0.7.0` | `0.8.0` | `>=3.6` |
| `1.6.0` | `0.7.0` | `0.6.0` | `0.7.0` | `>=3.6` |
| `1.5.1` | `0.6.1` | `0.5.0` | `0.6.0` | `>=3.5` |
| `1.5.0` | `0.6.0` | `0.5.0` | `0.6.0` | `>=3.5` |
| `1.4.0` | `0.5.0` | `0.4.0` | `0.5.0` | `==2.7`, `>=3.5`, `<=3.8` |
| `1.3.1` | `0.4.2` | | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.3.0` | `0.4.1` | | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.2.0` | `0.4.0` | | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.1.0` | `0.3.0` | | | `==2.7`, `>=3.5`, `<=3.7` |
| `<=1.0.1` | `0.2.2` | | | `==2.7`, `>=3.5`, `<=3.7` |

---

## Extra Info

### About PyTorch v1.6.0

A fatal bug is encountered and [this patch][24] is applied while building PyTorch v1.6.0.
After that, `whl` files can be successfully built under every Python version.

### About TorchText

The latest `torchtext` version you can install from PyPI (`pip`) is [`0.6.0`][17], namely `torchtext-0.6.0-py3-none-any.whl`,
is the last official version that is available for all devices.

From that on, the newer version are only built for `x86_64` / `amd64`, like other projects.
However, for `torchtext`, version `0.6.0` is deprecated but significantly more recent than the dropped versions of other projects.

### CUDA / CUDNN Support

Since the building environment (as below) does not contain an Nvidia GPU,
the wheels could not be built with cuda support.

If you need it, please use an [Nvidia Jetson][30] board to run the [building code](build/torch.sh).

### Building Environment

> SoC: [Allwinner H6][23] (quad-core A53)
> 
> Architecture: ARMv8 / ARM64 / `aarch64`
> 
> OS: Ubuntu 20.04.1 focal LTS
> 
> Virtualization: **Docker**

### Performance

Test date: 2020-12-25

> Less execution time is better

| Platform | Specs | Task | Avg. Time | Version |
| :---: | :---: | :---: | :---: | :---: |
| `aarch64` | ARM Cortex-A53 | Image Prediction | **41,264.514 ms** | `1.7.1` / `3.8.5` |
| `aarch64` | QUALCOMM Snapdragon 845 | Image Prediction | 9,763.317 ms | `1.7.1` / `3.8.5` |
| `amd64` | INTEL Core i7-6500U | Image Prediction | 374.274 ms | `1.7.1+cpu` / `3.8.6` |
| Google Colab | INTEL Xeon ??? / NVIDIA Tesla T4 | Image Prediction | 314.650 ms | `1.7.1+cu101` / `3.6.9` |
| Kaggle | INTEL Xeon ??? / NVIDIA Tesla P100 | Image Prediction | 307.503 ms | `1.7.1+cu110` / `3.7.6` |

Note:
1. This test was done by using a same _Cat or Dog_ model, to predict 10 random animal images (while same for each group).
2. The latest version of PyTorch was manually installed on all platforms, but driver and Python remained default.


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
[33]: https://torch.maku.ml/
[34]: https://hub.docker.com/r/kumatea/pytorch
