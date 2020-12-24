# pytorch-aarch64
[PyTorch][20], [torchvision][21] and [torchaudio][22] wheels for aarch64 / ARM64 devices

## Install

Run:

**`pip install torch torchvision torchaudio -f https://torch.maku.ml/whl/stable.html`**

Note: this command installs the latest version.
If you want a specific version, please check the [Corresponding Versions](#corresponding-versions) section.

If you want to pick the `whl` files manually, check the **[releases][16]**.

## Custom PyTorch Builds

### Click here to [check building status][17].

| py / ver | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: |
| 1.8.0 | | | | |
| 1.7.1 | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] |
| 1.7.0 | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] |
| 1.6.0<a href="#about-version-1.6.0"><sup>[i]</sup></a> | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] |
| <= 1.5.0 | ![canceled][15] | ![canceled][15] | ![canceled][15] | ![canceled][15] |

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

### `torchvision`
* All wheels will be built with the [Corresponding `torch` Versions](#corresponding-versions).

| ver | `torch` | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| master | master | | | | |
| 0.8.2 | 1.7.1 | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] |
| 0.8.0 / 0.8.1 | 1.7.0 | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] |
| 0.7.0 | 1.6.0 | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] |
| <= 0.6.1 | <= 1.5.0 | ![canceled][15] | ![canceled][15] | ![canceled][15] | ![canceled][15] |

### `torchaudio`
* All wheels will be built with the [Corresponding `torch` Versions](#corresponding-versions).

| ver | `torch` | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| master | master | | | | |
| 0.7.2 | 1.7.1 | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] | [![passing][2]][18] |
| 0.7.0 | 1.7.0 | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] | [![passing][2]][12] |
| 0.6.0 | 1.6.0 | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] | [![passing][2]][10] |
| <= 0.5.1 | <= 1.5.0 | ![canceled][15] | ![canceled][15] | ![canceled][15] | ![canceled][15] |

---

### Corresponding Versions
* [Corresponding `torch` and `torchvision` versions][13]
* [Corresponding `torch` and `torchaudio` versions][14]

| `torch` | `torchvision` | `torchaudio` | `python` |
| :---: | :---: | :---: | :---: |
| `master` / `nightly` | `master` / `nightly` | `master` / `nightly` | `>=3.6` |
| `1.7.1` | `0.8.2` | `0.7.2` | `>=3.6` |
| `1.7.0` | `0.8.0` / `0.8.1` | `0.7.0` | `>=3.6` |
| `1.6.0` | `0.7.0` | `0.6.0` | `>=3.6` |
| `1.5.1` | `0.6.1` | `0.5.0` | `>=3.5` |
| `1.5.0` | `0.6.0` | `0.5.0` | `>=3.5` |
| `1.4.0` | `0.5.0` | `0.4.0` | `==2.7`, `>=3.5`, `<=3.8` |
| `1.3.1` | `0.4.2` | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.3.0` | `0.4.1` | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.2.0` | `0.4.0` | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.1.0` | `0.3.0` | | `==2.7`, `>=3.5`, `<=3.7` |
| `<=1.0.1` | `0.2.2` | | `==2.7`, `>=3.5`, `<=3.7` |

---

## Appendix

### About Version 1.6.0

A fatal bug is encountered and [this patch][24] is applied while building PyTorch v1.6.0.
After that, `whl` files can be successfully built under every Python version.

### Building Environment

> SoC: [Allwinner H6][23] (quad-core A53)
> 
> Architecture: ARMv8 / ARM64 / `aarch64`
> 
> OS: Ubuntu 20.04.1 focal LTS
> 
> Virtualization: **Docker**


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
[17]: https://github.com/KumaTea/pytorch-aarch64/issues/1
[18]: https://github.com/KumaTea/pytorch-aarch64/releases/tag/v1.7.1
[19]: https://status.openlabtesting.org/builds/builds?project=pytorch%2Fpytorch
[20]: https://github.com/pytorch/pytorch
[21]: https://github.com/pytorch/vision
[22]: https://github.com/pytorch/audio
[23]: https://linux-sunxi.org/H6
[24]: https://github.com/pytorch/pytorch/issues/33124#issuecomment-602048845
