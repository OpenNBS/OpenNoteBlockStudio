# Python extensions for Open Note Block Studio

This is a subproject of Open Note Block Studio, which holds the Python modules used for various export functions, as well as scripts for managing dependencies and packaging.

## Building

1. Make sure to install [Git LFS](https://git-lfs.github.com/) before cloning the project and/or contributing.

2. Make sure to install the **exact** Python version that `GMPython` was compiled with. This is currently 3.8.10 (32-bit). ([download](https://www.python.org/downloads/release/python-3810/))

3. This subproject uses [poetry](https://python-poetry.org/) for managing dependencies. Make sure to install it, and run the following command with the subproject's root (`datafiles/Data/Python`) as your current working directory:

    ```shell
    $ poetry env use 3.8 # if you have more than one Python version installed
    $ poetry install --no-dev
    ```

4. Run `package.py`:

    ```shell
    $ python package.py
    ```

    This will prepare all dependencies to be packaged with Note Block Studio's executable.

5. Delete the `.venv` directory that was created.

6. Open the project in GameMaker, and save it so the included files are registered. **Do NOT commit the changes to the project file.**

7. You can now build the project in GameMaker!
