# conda package manifest generator

import os
import shutil
import requests


pytorch = '1.11.0'
torchvision = '0.12.0'

abis = {
    'py36': 'cp36-cp36m',
    'py37': 'cp37-cp37m',
    'py38': 'cp38-cp38',
    'py39': 'cp39-cp39',
    'py310': 'cp310-cp310',
    'pp37': 'pp37-pypy37_pp73',
    'pp38': 'pp38-pypy38_pp73',
    'pp39': 'pp39-pypy39_pp73',
}
conda_packages_path = '../conda'


def get_version_range(major_version, minor_version):
    version_string = f'{major_version}.{minor_version}'
    return f'>={version_string},<{major_version}.{int(minor_version) + 1}.0a0'


def process_dependencies_versions(info, py_ver):
    if not py_ver == 'py36':
        info = info.replace('    - dataclasses # [py36]\n', '')
    if py_ver == 'py310':
        info = info.replace('    - numpy 1.19', '    - numpy 1.22')
    return info


def generate_pytorch_meta(py_ver, pytorch_version, pytorch_dir):
    with open('pytorch.meta.yaml', 'r') as f:
        meta = f.read()

    python_abi = abis[py_ver]
    python_version = python_abi[2:python_abi.index('-')]
    major_version = python_version[:1]
    minor_version = python_version[1:]
    python_version = f'{major_version}.{minor_version}'
    python_version_range = get_version_range(major_version, minor_version)

    if 'pp' in py_ver:
        meta = meta.replace('string: pyFORMAT_PYTHON_VERSION', 'string: ppFORMAT_PYTHON_VERSION')
        meta = meta.replace('- python FORMAT_PYTHON_VERSION', '- python FORMAT_PYTHON_VERSION *_73_pypy')
        meta = meta.replace('- python FORMAT_PYTHON_RANGE', '- python FORMAT_PYTHON_RANGE *_73_pypy')

    meta = meta.replace('FORMAT_PYTORCH_VERSION', pytorch_version)
    meta = meta.replace('FORMAT_PYTHON_VERSION', python_version)
    meta = meta.replace('FORMAT_PYTHON_RANGE', python_version_range)

    meta = process_dependencies_versions(meta, py_ver)

    with open(os.path.join(pytorch_dir, 'meta.yaml'), 'w') as f:
        f.write(meta)


def generate_torchvision_meta(py_ver, torchvision_version, torchvision_dir):
    with open('torchvision.meta.yaml', 'r') as f:
        meta = f.read()

    python_abi = abis[py_ver]
    python_version = python_abi[2:python_abi.index('-')]
    major_version = python_version[:1]
    minor_version = python_version[1:]
    python_version = f'{major_version}.{minor_version}'
    python_version_range = get_version_range(major_version, minor_version)
    pytorch_version = pytorch
    pytorch_version_range = get_version_range(
        pytorch_version.split('.')[0],
        pytorch_version.split('.')[1]
    )

    if 'pp' in py_ver:
        meta = meta.replace('string: pyFORMAT_PYTHON_VERSION', 'string: ppFORMAT_PYTHON_VERSION')
        meta = meta.replace('- python FORMAT_PYTHON_VERSION', '- python FORMAT_PYTHON_VERSION *_73_pypy')
        meta = meta.replace('- python FORMAT_PYTHON_RANGE', '- python FORMAT_PYTHON_RANGE *_73_pypy')

    meta = meta.replace('FORMAT_TORCHVISION_VERSION', torchvision_version)
    meta = meta.replace('FORMAT_PYTHON_VERSION', python_version)
    meta = meta.replace('FORMAT_PYTHON_RANGE', python_version_range)
    meta = meta.replace('FORMAT_PYTORCH_VERSION', pytorch_version)
    meta = meta.replace('FORMAT_PYTORCH_RANGE', pytorch_version_range)

    meta = process_dependencies_versions(meta, py_ver)

    with open(os.path.join(torchvision_dir, 'meta.yaml'), 'w') as f:
        f.write(meta)


def generate_manifest(python_version, pytorch_version, torchvision_version,
                      pytorch_license, torchvision_license):
    working_dir = os.path.join(conda_packages_path, python_version)
    os.mkdir(working_dir)
    pytorch_dir = os.path.join(working_dir, 'pytorch')
    os.mkdir(pytorch_dir)
    torchvision_dir = os.path.join(working_dir, 'torchvision')
    os.mkdir(torchvision_dir)

    # meta.yaml
    generate_pytorch_meta(python_version, pytorch_version, pytorch_dir)
    generate_torchvision_meta(python_version, torchvision_version, torchvision_dir)

    # build.sh
    with open('torch.sh', 'r') as f:
        torch_build = f.read()
    torch_build = torch_build.replace('FORMAT_PYTHON_VERSION', python_version)
    torch_build = torch_build.replace('FORMAT_PYTORCH_VERSION', pytorch_version)
    with open(os.path.join(pytorch_dir, 'build.sh'), 'w') as f:
        f.write(torch_build)

    with open('vision.sh', 'r') as f:
        vision_build = f.read()
    vision_build = vision_build.replace('FORMAT_PYTHON_VERSION', python_version)
    vision_build = vision_build.replace('FORMAT_PYTORCH_VERSION', pytorch_version)
    vision_build = vision_build.replace('FORMAT_TORCHVISION_VERSION', torchvision_version)
    with open(os.path.join(torchvision_dir, 'build.sh'), 'w') as f:
        f.write(vision_build)

    # LICENSE
    with open(os.path.join(pytorch_dir, 'LICENSE'), 'w') as f:
        f.write(pytorch_license)
    with open(os.path.join(torchvision_dir, 'LICENSE'), 'w') as f:
        f.write(torchvision_license)


if __name__ == '__main__':
    shutil.rmtree(conda_packages_path, ignore_errors=True)
    os.mkdir(conda_packages_path)

    pytorch_license_content = requests.get(
        'https://raw.githubusercontent.com/pytorch/pytorch/master/LICENSE'
    ).text
    torchvision_license_content = requests.get(
        'https://raw.githubusercontent.com/pytorch/vision/master/LICENSE'
    ).text

    for pyv in abis:
        generate_manifest(pyv, pytorch, torchvision,
                          pytorch_license_content, torchvision_license_content)
