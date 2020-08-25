import re
import sys

version_pattern = re.compile(r"^\d+\.\d+\.\d+")

from bs4 import BeautifulSoup
import requests

tool = sys.argv[1]
url = f"https://releases.hashicorp.com/{tool}/"
page = requests.get(url).text

soup = BeautifulSoup(page, 'html.parser')
files = [url + '/' + node.get('href') for node in soup.find_all('a') if node.get('href')]

for fpath in files:
    try:
        *_, version = fpath.rsplit(f"{tool}/", maxsplit=1)
    except ValueError:

        continue
    if version_pattern.match(version):
        print(version.strip('/').strip('+ent'))
        exit()
