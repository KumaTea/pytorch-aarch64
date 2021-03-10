# pytorch-aarch64

[![Build Status][40]][41] [![Coverage][43]][16] [![ARM][44]][45]

[PyTorch][20]、[torchvision][21]、[torchaudio][22] [torchtext][28] 和 [torchcsprng][42] 的安装包 (whl) ，适用于 aarch64 / ARMv8 / ARM64 设备

[English](README.md) ([for GitHub][32]) | [Gitee][31] | [Web][33]

## 安装

运行：

**`pip install torch -f https://cf.torch.maku.ml/whl/stable.html`**

备用链接：`pip install torch -f https://torch.maku.ml/whl/stable.html`

如有需要，添加 `torchvision` `torchaudio` `torchtext` `torchcsprng` 等包。

注意：此命令安装的是最新版本。
要选择特定的版本，请查看 [对应版本](README.md#corresponding-versions) 部分。

如果需要手动选择`whl`文件，请查看 **[release][16]** 。

## Docker

**`docker run -it kumatea/pytorch`**

运行 `docker pull kumatea/pytorch` 以拉取镜像。

[点击此处][34] 查看所有版本。

### [FastAI][27]

[FastAI][27]是一个基于PyTorch的优秀[开源][25]高级深度学习框架。
它推荐用 `conda` 安装，但没有针对 `aarch64` 的 [Anaconda][26] 。
所以，用以下方法安装 `fastai` 。

`pip install fastai -f https://cf.torch.maku.ml/whl/stable.html`

`torch` 和 `torchvision` 将作为依赖自动安装。

同样，`fastbook` 也可以用以下方法安装。

`pip install fastbook -f https://cf.torch.maku.ml/whl/stable.html`

---

## 附加信息

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
[35]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.5.1
[36]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.5.0
[37]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.4.1
[38]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.4.0
[39]: https://github.com/KumaTea/pytorch-aarch64#official-pytorch-ci-builds
[40]: https://travis-ci.org/KumaTea/pytorch-aarch64.svg?branch=main
[41]: https://travis-ci.org/KumaTea/pytorch-aarch64
[42]: https://github.com/pytorch/csprng
[43]: https://shields.io/badge/python-3.6%20%7C%203.7%20%7C%203.8%20%7C%203.9-blue
[44]: https://shields.io/badge/ARM-v7%20%7C%20v8-blue
[45]: https://github.com/KumaTea/pytorch-arm
[46]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.4.0
