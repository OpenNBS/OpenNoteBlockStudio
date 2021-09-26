![alt text](https://i.imgur.com/AMd0NBh.png)
<p align="center">
An open source continuation of Minecraft Note Block Studio with exciting new features!
</p>

### Download
You can download Open Note Block Studio [here](https://hielkeminecraft.github.io/OpenNoteBlockStudio/).
You can either download it as an `.exe` installer (recommended), or as a ZIP file.

### Issues
To report issues, please head over to the [Issues](https://github.com/HielkeMinecraft/OpenNoteBlockStudio/issues) page.
You can also join our [Discord server](https://discord.gg/w35BqQp) to get support and share your creations!

### Contributions
This project is written in GameMaker Language (GML). You must have GameMaker Studio 2 in order to open the project and make changes.  
For contributions, please open a pull request.

### Website
For everything else, please visit the [website](https://hielkeminecraft.github.io/OpenNoteBlockStudio/).

## Linux Installation Guide
If you want to install Open Note Block Studio on Linux, you have to use WINE. This guide was written using an installation on Ubuntu 20.04 LTS.

1. Install WINE (if you already have WINE installed, you can skip this step):
```sh
$ sudo dpkg --add-architecture i386
$ wget -qO - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
$ sudo add-apt-repository ppa:cybermax-dexter/sdl2-backport
$ sudo apt-add-repository "deb https://dl.winehq.org/wine-builds/ubuntu $(lsb_release -cs) main"
$ sudo apt update && sudo apt install --install-recommends winehq-stable
```
2. After installing WINE, run `winecfg`, click the "Audio" tab, and set everything to "PulseAudio".
3. Start the Open Note Block Studio .exe binary with WINE: (Replace `/path/to/your/file` with the directory you downloaded the .exe binary)
```sh
$ wine /home/path/to/your/file/Minecraft.Note.Block.Studio.exe
```
4. Follow the instructions of the installer.
5. After installation, navigate to your `.bashrc` file and open it.
6. Add this line to your `.bashrc` file:
```sh
alias wine="PULSE_LATENCY_MSEC=10 wine"
```
7. Restart your terminal and open the installed Minecraft Note Block Studio.

