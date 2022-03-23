import os
import shutil
import zipfile
from pathlib import Path


DO_NOT_ADD_TO_BUILD = [
     '__pycache__',
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


def pack_module(path, package_name):
     full_output_path = Path(OUT_PATH, f'{package_name}.zip')
     with zipfile.PyZipFile(full_output_path, mode='w') as zip_module:
          zip_module.writepy(path)


def pack_file(path, package_name):
     full_output_path = Path(OUT_PATH, path, f'{package_name}.zip')
     with zipfile.PyZipFile(full_output_path, mode='w') as zip_module:
          zip_module.writepy(path)


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
     package_list = []
     for path in os.listdir(LIB_PATH):
          lib_name = os.path.basename(path)
          lib_path = Path(LIB_PATH, lib_name)
          if lib_name not in DO_NOT_ADD_TO_BUILD:
               if os.path.isdir(lib_path):
                    if '.dist-info' not in lib_name:
                         pack_module(lib_path, lib_name)
                         package_list.append(lib_name)
               else:
                    filename, ext = os.path.splitext(lib_name)
                    if ext == '.py':
                         pack_module(lib_path, filename)
                         package_list.append(filename)

     # Add zip files to sys.path
     fpath = Path(OUT_PATH, 'packages.pth')
     with open(fpath, 'w') as f:
          f.writelines(f'{package}.zip\n' for package in package_list)

     # Delete virtual environment
     #shutil.rmtree(ENV_PATH)


if __name__ == "__main__":
     main()