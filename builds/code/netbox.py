#!/usr/bin/env python
import argparse
import ConfigParser
import os
import os.path
import sys
import json
import requests
from pprint import pprint
import subprocess
import timeit

base_url = 'https://netbox.datto.net/api'
token_str = 'Token 1a324b404eabc57f7f62c2894dbd2ecc18d4ab64'
headers = {'Accept':'application/json', 'Authorization': token_str}
r = requests.get(base_url, headers=headers)
result = json.loads( r.text )

for i in result:
    print( i )
