import json
import requests
from datetime import datetime


author = 'KumaTea'
project = 'pytorch-aarch64'
whl_dir = '../whl'
pt = 'pytorch'
pt_ci_index = './pt_ci.json'  # pytorch official CI builds
gh_rl_index = './gh_rl.json'  # GitHub released wheels
pt_ci_api = f'https://status.openlabtesting.org/builds/api/builds?&project={pt}/{pt}'  # job_name
gh_rl_api = f'https://api.github.com/repos/{author}/{project}/releases'


def get_pt_ci():
    result_raw = requests.get(pt_ci_api).json()
    # (datetime.utcnow() - datetime.strptime('2020-12-15T00:32:07', '%Y-%m-%dT%H:%M:%S')).days
    pass


def get_gh_rl():
    result_raw = requests.get(gh_rl_api).json()
    pass


def update_index():
    pass


def get_status():
    pass


def get_wheel():
    pass
