---
---

![alt text](https://i.imgur.com/1RYhYFU.png)
<p align="center">
An open source continuation of Minecraft Note Block Studio with exciting new features. 
</p>


## Download
You can either download as .exe (recommended), or as a zip file.

<a href="https://github.com/HielkeMinecraft/OpenNoteBlockStudio/releases/latest" class="btn btn-primary">Latest versison</a>


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

### Changed NBS format
To make Note Block Studio work better in the future, the .nbs format has changed. 
The first 2 bytes (used to be song length) have been changed to 0 to indicate the new format. 

After this, the next byte is the .nbs version. Right now that version is 2, but if the nbs format needs changes in the future, it will be different.

#### NBS version 1 changes:
The byte after the .nbs version is now the first custom instrument index.
**Example**: If there are 10 vanilla instruments, 10 is the first index of the custom instruments (remember, we start counting from 0).

#### NBS version 2 changes:
Now stereo information is saved. Because of this the sound can pan to the left/right. For each layer, there's now a byte that determines how much that layer pans. 0 is 2 blocks right, 100 is centre, 200 is 2 blocks left.
