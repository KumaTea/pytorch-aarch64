# conda package manifest generator

import os
import shutil
import requests


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

    meta = meta.replace('FORMAT_PYTORCH_VERSION', pytorch_version)
    if python_version == 'py310':
        meta = meta.replace('    - numpy=1.19', '    - numpy=1.22')

    with open(os.path.join(pytorch_dir, 'meta.yaml'), 'w') as f:
        f.write(meta)


def generate_manifest(python_version, pytorch_version, license_content):
    working_dir = os.path.join(conda_packages_path, abis[python_version])
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
        generate_manifest(pyv, '1.10.0', pytorch_license_content)
