import subprocess


def patch_arguments(function, **patched_kwargs):
     def decorate_name(*args, **kwargs):
          kwargs.update(patched_kwargs)
          return function(*args, **kwargs)
     return decorate_name


def main(*args, **kwargs):
     print("Hello world!")

     # Monkey-patch to avoid ffmpeg/ffprobe calls opening console window
     subprocess.Popen = patch_arguments(subprocess.Popen, creationflags=subprocess.CREATE_NO_WINDOW)
     
     import nbsaudio
     nbsaudio.main.render_audio(*args, **kwargs)


if __name__ == "__main__":
     main()
