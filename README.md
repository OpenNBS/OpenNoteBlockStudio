# Open Minecraft Note Block Studio
An open source continuation of Minecraft Note Block Studio. 


## Download
You can download Open Note Block studio [Here](https://github.com/HielkeMinecraft/OpenNoteBlockStudio/releases/latest).
You can either download as .exe (recommended), or as a zip file.

## Issues:
For issues, please head over to the [issues](https://github.com/HielkeMinecraft/OpenNoteBlockStudio/issues) page.

## Contributions:
This project is written in Game Maker Language (GML). You must have GameMaker Studio 2 in order to open this project and make changes.

For contributions, please open up a [pull request](https://github.com/HielkeMinecraft/OpenNoteBlockStudio/pulls).

## Features:

### 1.14 Note Block Support:
Open Note Block studio supports all 6 note block sounds added in 1.14!

### Datapack Export:
![alt text](https://i.imgur.com/TGH4m4r.jpg)

With datapack export, you can export your song to a datapack. Just copy the generated datapack to your world's "datapacks" folder, and then you: 
 * Can **play** your song by running ```/function <datapack_name>:play```
* Can **pause** your song by running```/function <datapack_name>:pause```
* Can **stop** your song by running ```/function <datapack_name>:stop```

Datapack export also has an option to allow nearby players to hear the music too. This way you can be a walking music player!


### Dark theme:
![alt text](https://i.imgur.com/PVbiJ26.jpg)
When using Note Block Studio late at night, you might have wondered: why are my eyes burning?
Well wonder no more! With dark theme you can compose all night long!

### Changed .nbs format
To make Note Block Studio work better in the future, the .nbs format has changed. 
The first 2 bytes (used to be song length) have been changed to 0 to indicate the new format. 

After this, the next byte is the .nbs version. Right now that version is 1, but if the nbs format needs changes in the future, it will be different.

The byte after that is the first custom instrument index. 
**Example**: If there are 10 'normal' instruments, 10 is the first index of the custom instruments (remember, we start counting from 0).

The rest of the format is the same, with song height being the next short.

