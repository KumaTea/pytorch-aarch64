# conda package manifest generator

import os
import shutil
import requests


pytorch = '1.10.0'

abis = {
    'py36': 'cp36-cp36m',
    'py37': 'cp37-cp37m',
    'py38': 'cp38-cp38',
    'py39': 'cp39-cp39',
    'py310': 'cp310-cp310',
}
conda_packages_path = '../conda'


def generate_meta(python_version, pytorch_version, pytorch_dir):
    with open('meta.yaml', 'r') as f:
        meta = f.read()

    python_abi = abis[python_version]
    python_version_string = python_abi[2:python_abi.index('-')]
    major_version = python_version_string[:1]
    minor_version = python_version_string[1:]
    python_version_string = f'{major_version}.{minor_version}'
    python_version_range = f'>={python_version_string},<{major_version}.{int(minor_version) + 1}.0a0'

    meta = meta.replace('FORMAT_PYTORCH_VERSION', pytorch_version)
    meta = meta.replace('FORMAT_PYTHON_VERSION', python_version_string)
    meta = meta.replace('FORMAT_PYTHON_RANGE', python_version_range)

    if not python_version == 'py36':
        meta = meta.replace('    - dataclasses # [py36]\n', '')
    if python_version == 'py310':
        meta = meta.replace('    - numpy=1.19', '    - numpy=1.22')

    with open(os.path.join(pytorch_dir, 'meta.yaml'), 'w') as f:
        f.write(meta)


def generate_manifest(python_version, pytorch_version, license_content):
    working_dir = os.path.join(conda_packages_path, python_version)
    os.mkdir(working_dir)
    pytorch_dir = os.path.join(working_dir, 'pytorch')
    os.mkdir(pytorch_dir)

    # meta.yaml
    generate_meta(python_version, pytorch_version, pytorch_dir)

    # build.sh
    with open(os.path.join(pytorch_dir, 'build.sh'), 'w') as f:
        f.write(
            f'$PYTHON -m pip install torch-{pytorch_version}-{abis[python_version]}-linux_aarch64.whl'
        )

    # LICENSE
    with open(os.path.join(pytorch_dir, 'LICENSE'), 'w') as f:
        f.write(license_content)


if __name__ == '__main__':
    shutil.rmtree(conda_packages_path, ignore_errors=True)
    os.mkdir(conda_packages_path)

    pytorch_license_content = requests.get(
        'https://raw.githubusercontent.com/pytorch/pytorch/master/LICENSE'
    ).text

    for pyv in abis:
        generate_manifest(pyv, pytorch, pytorch_license_content)
