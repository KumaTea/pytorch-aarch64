# pytorch-aarch64
PyTorch, torchvision and torchaudio wheel for aarch64 / ARM64 devices

## Install

Run:

`pip install torch torchvision torchaudio -f https://torch.maku.ml/whl/torch.html`

## Official PyTorch CI Builds

| ver \ py | 3.6 | 3.7 | 3.8 | 3.9 |
| :---: | :---: | :---: | :---: | :---: |
| 1.4.0 | [![Build Status](http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.4.0)](https://torch.maku.ml/api?project=torch&ver=140&py=36) | | | |
| 1.5.0 | [![Build Status](http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.5.0)](https://torch.maku.ml/api?project=torch&ver=150&py=36) | | | |
| 1.6.0 | [![Build Status](http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-v1.6.0)](https://torch.maku.ml/api?project=torch&ver=160&py=36) | | | |
| 1.7.0 | | | | |
| 1.7.1 | | | | |
| 1.8.0 | | | | |
| master | [![Build Status](http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py36)](https://torch.maku.ml/api?project=torch&ver=master&py=36) | [![Build Status](http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py37)](https://torch.maku.ml/api?project=torch&ver=master&py=37) | [![Build Status](http://openlabtesting.org:15000/badge?project=pytorch%2Fpytorch&job_name=pytorch-arm64-build-daily-master-py38)](https://torch.maku.ml/api?project=torch&ver=master&py=38) | |

## Custom PyTorch Builds

### `torchvision`
* All wheels will be built in **Python 3.8**

### `torchaudio`
* All wheels will be built in **Python 3.8**

---

### Corresponding Versions
* [Corresponding `torch` and `torchvision` versions](https://github.com/pytorch/vision#installation)
* [Corresponding `torch` and `torchaudio` versions](https://github.com/pytorch/audio#dependencies)

| `torch` | `torchvision` | `torchaudio` | `python` |
| :---: | :---: | :---: | :---: |
| `master` / `nightly` | `master` / `nightly` | `>=3.6` |
| `1.7.1` | `0.8.2` | | `>=3.6` |
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
