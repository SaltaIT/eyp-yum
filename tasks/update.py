#!/usr/bin/python

import sys
import json
from pprint import pprint
import subprocess

params = json.load(sys.stdin)

packages = params['package'].split(',')

result={}

for package in packages:
  result[package]={}
  result[package]['initial']=subprocess.check_output("rpm -qa "+package, shell=True)
  result[package]['requested']=package
  result[package]['update_process']=subprocess.check_output("yum update "+package+" -y", shell=True)
  result[package]['result']=subprocess.check_output("rpm -qa "+package, shell=True)

print(json.dumps(result))
