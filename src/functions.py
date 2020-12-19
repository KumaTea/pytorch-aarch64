from os.path import basename
import requests
from urllib.parse import quote_plus, urlparse


author = 'KumaTea'
project = 'pytorch-aarch64'
whl_dir = '../whl'
rl_file = 'stable.html'
ci_file = 'ci.html'
pt = 'pytorch'
pt_ci_index = './pt_ci.json'  # pytorch official CI builds
gh_rl_index = './gh_rl.json'  # GitHub released wheels
pt_ci_api = f'https://status.openlabtesting.org/builds/api/builds?&project={pt}/{pt}'  # job_name
gh_rl_api = f'https://api.github.com/repos/{author}/{project}/releases'


def get_pt_ci():
    print('Fetching PyTorch CI builds...')
    assets = []
    jobs = []
    result_raw = requests.get(pt_ci_api).json()
    for release in result_raw:
        if release['job_name'] not in jobs and release['result'] == 'SUCCESS':
            jobs.append(release['job_name'])
            assets.append({
                'name': basename(urlparse(release['artifacts'][0]['url']).path),
                'url': release['artifacts'][0]['url']
            })
    return assets


def get_gh_rl():
    print('Fetching GitHub releases...')
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
    rl_list = get_gh_rl()
    ci_list = get_pt_ci()
    print('Generating html...')
    rl_html = ''
    ci_html = ''
    for file in rl_list:
        rl_html += '<a href=\"' + file['url'] + '\">' + \
                   quote_plus(file['name']) + '</a><br>\n'
    with open(f'{whl_dir}/{rl_file}', 'w', encoding='utf-8') as html_file:
        html_file.write(rl_html)
    for file in ci_list:
        ci_html += '<a href=\"' + file['url'] + '\">' + \
                   quote_plus(file['name']) + '</a><br>\n'
    with open(f'{whl_dir}/{ci_file}', 'w', encoding='utf-8') as html_file:
        html_file.write(ci_html)
