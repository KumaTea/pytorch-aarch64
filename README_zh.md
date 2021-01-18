# pytorch-aarch64
[PyTorch][20]、[torchvision][21]、[torchaudio][22] 和 [torchtext][28] 的安装包 (whl) ，适用于 aarch64 / ARMv8 / ARM64 设备

[English](README.md) ([for GitHub][32]) | [Gitee][31] | [Web][33]

## 安装

运行：

**`pip install torch -f https://torch.maku.ml/whl/stable.html`**

如有需要，添加 `torchvision` 、 `torchaudio` 、 `torchtext` 等包。

注意：此命令安装的是最新版本。
要选择特定的版本，请查看 [对应版本](README.md#corresponding-versions) 部分。

如果要手动选择`whl`文件，请查看 **[release][16]** 。

## Docker

**`docker run -it kumatea/pytorch`**

运行 `docker pull kumatea/pytorch` 以拉取镜像。

[点击此处][34] 查看所有版本。

### [FastAI][27]

[FastAI][27]是一个基于PyTorch的优秀[开源][25]高级深度学习框架。
它推荐用 `conda` 安装，但没有针对 `aarch64` 的 [Anaconda][26] 。
所以，用以下方法安装 `fastai` 。

`pip install fastai -f https://torch.maku.ml/whl/stable.html`

`torch` 和 `torchvision` 将作为依赖自动安装。

同样，`fastbook` 也可以用以下方法安装。

`pip install fastbook -f https://torch.maku.ml/whl/stable.html`

---

## 附加信息

### 关于 PyTorch v1.6.0

在编译 PyTorch v1.6.0 时，遇到了一个致命 bug，因此应用了 [此补丁][24]。
除此之外，`whl` 文件可以在所有其他 Python 版本下成功构建。

### 关于 TorchText

你可以从 PyPI (`pip`) 安装到的最新 `torchtext` 版本是 [`0.6.0`][17]，即 `torchtext-0.6.0-py3-none-any.whl`。
这是最后一个适用于所有设备的官方版本。

从那以后，新的版本和其余项目一样，只为 `x86_64` / `amd64` 编译。
然而 `torchtext` 的 `0.6.0` 版本尽管已过时，但仍比其他项目的停更版本更新。

### CUDA / CUDNN 支持

由于编译环境（见下）不包含 Nvidia GPU，无法支持 cuda 。

如有需要，请使用 [Nvidia Jetson][30] 开发板运行 [编译代码](build/torch.sh)。

### 编译环境

> SoC：[全志H6][23] (四核A53)
> 
> 架构：ARMv8 / ARM64 / `aarch64` 架构
> 
> 操作系统：Debian Buster
> 
> 虚拟化：**Docker**

注：版本小于或等于1.7.0的 wheel 二进制文件是使用 Ubuntu 20.04.1 Focal LTS 编译的。
由于GCC版本太新 (v9.3.0) 不能在 Debian Buster 上运行。

### 性能

测试日期：2020-12-25

> 执行时间越少越好

| 平台 | 规格 | 任务 | 平均时间 | 版本 |
| :---: | :---: | :---: | :---: | :---: |
| `aarch64` | ARM Cortex-A53 | Image Prediction | **41,264.514 ms** | `1.7.1` / `3.8.5` |
| `aarch64` | QUALCOMM Snapdragon 845 | Image Prediction | 9,763.317 ms | `1.7.1` / `3.8.5` |
| `amd64` | INTEL Core i7-6500U | Image Prediction | 374.274 ms | `1.7.1+cpu` / `3.8.6` |
| Google Colab | INTEL Xeon ??? / NVIDIA Tesla T4 | Image Prediction | 314.650 ms | `1.7.1+cu101` / `3.6.9` |
| Kaggle | INTEL Xeon ??? / NVIDIA Tesla P100 | Image Prediction | 307.503 ms | `1.7.1+cu110` / `3.7.6` |

注：
1. 这个测试是通过使用相同的 _猫或狗_ 模型，来预测10个随机的动物图像（同时每组相同）。
2. 所有平台都手动安装了最新版本的PyTorch，但驱动和Python仍然是默认的。


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
