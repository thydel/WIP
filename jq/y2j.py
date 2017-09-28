#!/usr/bin/python

import sys, yaml, json

json.dump(yaml.load(sys.stdin), sys.stdout, indent=4, default=str, sort_keys=True)
