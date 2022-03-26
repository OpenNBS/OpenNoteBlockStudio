import os
import shutil
import zipfile
from pathlib import Path


DO_NOT_ADD = [
     '_distutils_hack',
     'pip',
     'pkg_resources',
     'setuptools',
     'wheel',
     '_virtualenv.py',
]

ENV_PATH = Path(".venv")
LIB_PATH = Path(ENV_PATH, "Lib", "site-packages")
OUT_PATH = Path("site-packages")


def pack_filter(path):
     fn = os.path.basename(path)
     return not (fn in DO_NOT_ADD or '.dist-info' in fn)

copy_filter = shutil.ignore_patterns('__pycache__')


def main():

     # Check the script is being run from the right subdirectory
     cwd = Path.cwd()
     if not cwd.parts[-3:] == ('datafiles', 'Data', 'Python'):
          raise RuntimeWarning("This script must be run from the datafiles/Data/Python "
                               "subfolder in the Open Note Block Studio root directory.")

     # Delete previous build directory
     if Path.exists(OUT_PATH):
          shutil.rmtree(OUT_PATH)

     # Create output directory
     os.makedirs(OUT_PATH)

     # Package dependencies
     with zipfile.PyZipFile("site-packages.zip", mode='w') as zip_module:
          for path in os.listdir(LIB_PATH):
               lib_name = os.path.basename(path)
               lib_path = Path(LIB_PATH, lib_name)
               print(path)
               try:
                    zip_module.writepy(lib_path, filterfunc=pack_filter)
               except RuntimeError:  # only directories or .py files
                    continue

     # Delete virtual environment
     #shutil.rmtree(ENV_PATH)


if __name__ == "__main__":
     main()