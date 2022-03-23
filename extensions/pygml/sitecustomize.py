import site
import sys
import os

path = ("Data", "Python", "site-packages")
sys.path.insert(0, path)
site.addsitedir(path)


with open('test.txt') as f:
     f.write('\n'.join(site.getsitepackages()))
     f.write('\n'.join(sys.path))
     