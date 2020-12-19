# pytorch-aarch64
PyTorch, torchvision and torchaudio wheel for aarch64 / ARM64 devices

## Install

Run:

`pip install torch torchvision torchaudio -f https://torch.maku.ml/whl/stable.html`

Note: this command installs the latest version.
If you want a specific version, please check the [Corresponding Versions](#corresponding-versions) section.

If you want to pick the `whl` files manually, check the **[releases](../../releases)**.

## Custom PyTorch Builds

### Click here to [check building status](../../issues/1).

| ver \ py | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: |
| 1.8.0 | | | | |
| 1.7.1 | | | | |
| 1.7.0 | | | | |
| 1.6.0 | | | | |
| 1.5.0 - | ![canceled][15] | ![canceled][15] | ![canceled][15] | ![canceled][15] |

## Official PyTorch CI Builds

| ver \ py | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: |
| master | [![Build Status][7]][8] | [![Build Status][9]][10] | [![Build Status][11]][12] | |
| 1.8.0 | | | | |
| 1.7.1 | | | | |
| 1.7.0 | | | | |
| 1.6.0 | [![Build Status][5]][6] | | | |
| 1.5.0 | [![Build Status][3]][4] | | | |
| 1.4.0 | [![Build Status][1]][2] | | | |

### `torchvision`
* All wheels will be built with the [Corresponding `torch` Versions](#corresponding-versions).

| ver | `torch` | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| master | master | | | | |
| 0.8.2 | 1.7.1 | | | | |
| 0.8.1 | 1.7.0 | | | | |
| 0.8.0 | 1.7.0 | | | | |
| 0.7.0 | 1.6.0 | | | | |


### `torchaudio`
* All wheels will be built with the [Corresponding `torch` Versions](#corresponding-versions).

| ver | `torch` | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: | :---: |
| master | master | | | | |
| 0.7.2 | 1.7.1 | | | | |
| 0.7.0 | 1.7.0 | | | | |
| 0.6.0 | 1.6.0 | | | | |

---

### Corresponding Versions
* [Corresponding `torch` and `torchvision` versions][13]
* [Corresponding `torch` and `torchaudio` versions][14]

| `torch` | `torchvision` | `torchaudio` | `python` |
| :---: | :---: | :---: | :---: |
| `master` / `nightly` | `master` / `nightly` | `master` / `nightly` | `>=3.6` |
| `1.7.1` | `0.8.2` | `0.7.2` | `>=3.6` |
| `1.7.0` | `0.8.1` | `0.7.0` | `>=3.6` |
| `1.7.0` | `0.8.0` | `0.7.0` | `>=3.6` |
| `1.6.0` | `0.7.0` | `0.6.0` | `>=3.6` |
| `1.5.1` | `0.6.1` | `0.5.0` | `>=3.5` |
| `1.5.0` | `0.6.0` | `0.5.0` | `>=3.5` |
| `1.4.0` | `0.5.0` | `0.4.0` | `==2.7`, `>=3.5`, `<=3.8` |
| `1.3.1` | `0.4.2` | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.3.0` | `0.4.1` | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.2.0` | `0.4.0` | | `==2.7`, `>=3.5`, `<=3.7` |
| `1.1.0` | `0.3.0` | | `==2.7`, `>=3.5`, `<=3.7` |
| `<=1.0.1` | `0.2.2` | | `==2.7`, `>=3.5`, `<=3.7` |

[1]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.4.0
[2]: https://torch.maku.ml/api?project=torch&ver=140&py=36
[3]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.5.0
[4]: https://torch.maku.ml/api?project=torch&ver=150&py=36
[5]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.6.0
[6]: https://torch.maku.ml/api?project=torch&ver=160&py=36
[7]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py36
[8]: https://torch.maku.ml/api?project=torch&ver=master&py=36
[9]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py37
[10]: https://torch.maku.ml/api?project=torch&ver=master&py=37
[11]: http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py38
[12]: https://torch.maku.ml/api?project=torch&ver=master&py=38
[13]: https://github.com/pytorch/vision#installation
[14]: https://github.com/pytorch/audio#dependencies
[15]: https://img.shields.io/badge/build-canceled-lightgrey

---

### Environment

> SoC: [Allwinner H6](https://linux-sunxi.org/H6) (quad-core A53)
> 
> Architecture: ARMv8 / ARM64 / `aarch64`
> 
> OS: Ubuntu 20.04.1 focal LTS
> 
> Virtualization: **Docker**
