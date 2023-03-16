import compileall
import os
import shutil
import sys
import zipfile
from pathlib import Path


PYTHON_VERSION = "3.8.10"


DO_NOT_ADD = [
    "__pycache__",
    "_distutils_hack",
    "pip",
    "pkg_resources",
    "setuptools",
    "wheel",
    "_virtualenv.py",
]

BLACKLIST = ["numpy"]  # Special case - can't be loaded from ZIP

DO_NOT_ADD.extend(BLACKLIST)


ENV_PATH = Path(".venv")
LIB_PATH = Path(ENV_PATH, "Lib", "site-packages")

OUT_PATH = Path("Lib", "site-packages")
ZIP_PATH = Path("Lib", "site-packages.zip")
REL_PATH = Path("Data", "Python", OUT_PATH)


def pack_filter(path):
    fn = os.path.basename(path)
    return not (fn in DO_NOT_ADD or ".dist-info" in fn)


copy_filter = shutil.ignore_patterns("__pycache__")


def main():

    # Check if the Python version is correct
    py_version = ".".join(str(s) for s in sys.version_info[:3])
    if py_version != PYTHON_VERSION:
        raise RuntimeError(
            f"This script must be run in Python {PYTHON_VERSION} "
            f"(you're running {py_version})"
        )

    # Check the script is being run from the right subdirectory
    cwd = Path.cwd()
    if not cwd.parts[-3:] == ("datafiles", "Data", "Python"):
        raise RuntimeWarning(
            "This script must be run from the datafiles/Data/Python "
            "subfolder in the Open Note Block Studio root directory."
        )

    if not os.path.exists(ENV_PATH):
        raise FileNotFoundError(
            "The .venv directory was not found. Have you ran"
            "poetry install before running this script?"
        )

    # Delete previous build directory
    if Path.exists(OUT_PATH):
        print("Removing output directory")
        shutil.rmtree(OUT_PATH)

    # Create output directory
    os.makedirs(OUT_PATH)

    # Package dependencies
    package_count = 0
    with zipfile.PyZipFile(ZIP_PATH, mode="w") as zip_file:
        for path in os.listdir(LIB_PATH):
            lib_name = os.path.basename(path)
            lib_path = Path(LIB_PATH, lib_name)

            # Pre-compile all modules without absolute paths
            path_prefix = REL_PATH
            if os.path.isdir(lib_path):
                compileall.compile_dir(
                    lib_path, ddir=path_prefix, force=True, quiet=2, legacy=True
                )
            else:
                compileall.compile_file(
                    str(lib_path), ddir=path_prefix, force=True, quiet=2, legacy=True
                )

            # Write to ZIP
            try:
                zip_file.writepy(lib_path, filterfunc=pack_filter)
            except RuntimeError:  # only directories or .py files accepted
                continue
            else:
                if pack_filter(lib_path):
                    print(f"Packaging {lib_name}")
                    package_count += 1

    # Handle special cases
    for lib_name in BLACKLIST:
        print(f"Packaging {lib_name}")
        package_count += 1
        inpath = Path(LIB_PATH, lib_name)
        outpath = Path(OUT_PATH, lib_name)
        shutil.copytree(inpath, outpath, ignore=copy_filter)
        compileall.compile_dir(
            outpath, ddir=REL_PATH, force=True, quiet=True, legacy=True
        )
        # Remove corresponding .py files
        for root, _, files in os.walk(outpath):
            for filename in files:
                if filename.endswith(".py"):
                    os.remove(os.path.join(root, filename))

    print(f"Done! {package_count} packages were added.")
    print(
        f"Don't forget to delete the {ENV_PATH} directory before building the GameMaker project."
    )


if __name__ == "__main__":
    main()
