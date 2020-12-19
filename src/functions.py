import requests
from datetime import datetime
from urllib.parse import quote_plus


author = 'KumaTea'
project = 'pytorch-aarch64'
whl_dir = '../whl'
whl_file = 'stable.html'
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
    assets = []
    result_raw = requests.get(gh_rl_api).json()
    for release in result_raw:
        if release['assets']:
            for binary in release['assets']:
                assets.append({
                    'name': binary['name'],
                    'url': binary['browser_download_url']
                })
    return assets


def gen_index():
    whl_list = get_gh_rl()
    html = ''
    for file in whl_list:
        html += '<a href=\"' + quote_plus(file['name']) + '\"</a>' + \
                quote_plus(file['url']) + '<br>\n'
    with open(f'{whl_dir}/{whl_file}', 'w', encoding='utf-8') as html_file:
        html_file.write(html)


def get_status():
    pass


def get_wheel():
    pass
