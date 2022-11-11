![Open Note Block Studio logo](https://i.imgur.com/AMd0NBh.png)

<p align="center">
  <a href="https://github.com/OpenNBS/OpenNoteBlockStudio/releases/latest">
    <img src="https://img.shields.io/github/v/release/OpenNBS/OpenNoteBlockStudio?label=latest" alt="Latest version">
  </a>
  <a href="https://github.com/OpenNBS/OpenNoteBlockStudio/releases/latest">
    <img src="https://img.shields.io/github/downloads/OpenNBS/OpenNoteBlockStudio/total">
  </a>
  <a href="https://github.com/OpenNBS/OpenNoteBlockStudio/stargazers">
    <img src="https://img.shields.io/github/stars/OpenNBS/OpenNoteBlockStudio?style=social">
  </a>
  <a href="https://discord.gg/w35BqQp">
    <img src="https://img.shields.io/discord/608692895179997252?label=discord&logo=discord&logoColor=white&color=7289DA">
  </a>
  <a href="https://github.com/OpenNBS/OpenNoteBlockStudio/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/OpenNBS/OpenNoteBlockStudio">
  </a>
</p>
<p align="center">
An open source continuation of Minecraft Note Block Studio with exciting new features!
</p>

## Table of Contents
1. [Download](#download)
2. [Create Instructions](#create)
3. [Export Instructions](#export)
4. [Issues](#issues)
5. [Contributions](#contributions)
6. [Website](#website)

### Download<a name="download"></a>
You can download Open Note Block Studio [here](https://github.com/OpenNBS/OpenNoteBlockStudio/releases/latest).
You can either download it as an `.exe` installer (recommended), or as a ZIP file.

### Create Instructions<a name="create"></a>
![Primary Launch Options](https://i.imgur.com/bZepaSm.png)</p>
Launching the application offers 3 primary options to start from.

#### Create a new song
This option starts a .nbs project from scratch. You have full control over audio layers, instrument-type, and notes to play.
1. Select the instrument-type in the top-center menu bar, signified by its corresponding Minecraft block logo.
2. Select the note on the virtual piano keyboard you want to insert.
3. Left-click into the layer and wherever in the timeline you want your note.

Play/pause using the controls in the top-left of the menu bar.
You also have full contorl over note pitch, panning, and velocity in the controls to the right of that.
Copy/paste works intelligently to preserve the notes and settings applied in your timeline to make editing more seamless and interactive.

Save your file out as a .nbs, which is the standard format for this project:
* Read more here: https://opennbs.org/nbs

#### Load a song
Once your file is saved, use this option to re-open your project.
Since .nbs is standardized, you can also easily share your project with others or launch .nbs files from the community.

#### Generate song out of MIDI file
Instead of starting from scratch, you can import a standard MIDI file and the program will do its best to translate the notes into noteblocks.

* WARNING: Do not expect this to be a perfect translation. MIDI files are much less information-dense than other filetypes, such as mp3.
* Most users will need to do a lot of cleanup after importing an MIDI file, unless the file is very basic.

### Export Instructions<a name="export"></a>
After you create a song, there are 4 ways to export it.

#### Export as mp3...
You can choose to export the project as a data-rich mp3, either with or without locked layers.

#### Export as schematic...
You can export your project as a schematic file, with different formats for different versions of Minecraft.
You can also choose different layouts (simple or circular walkways), as well as fine-tune redstome timings.
* Learn more about importing schematics into your world here: https://www.minecraft-schematics.com/worldedit/tutorial/

#### Export as branch schematic...
While this offers more flexibility for schematic layout, this export feature is only available for Minecraft versions 1.12 and older.

#### Export as data pack...
For versions 1.13+, you can export your project into a datapack!
This allows you to listen in-game:
* Native quality
* No schematics
* Stereo mode
* ...and more!

Play your song by running:
* /function <datapack_name>:play
Pause your song by running:<\p>
* /function <datapack_name>:pause
Stop your song by running:<\p>
* /function <datapack_name>:stop

Learn more here: https://opennbs.org/features

### Issues<a name="issues"></a>
To report issues, please head over to the [Issues](https://github.com/OpenNBS/OpenNoteBlockStudio/issues) page.
You can also join our [Discord server](https://discord.gg/w35BqQp) to get support and share your creations!

### Contributions<a name="contributions"></a>
This project is written in GameMaker Language (GML). You must have GameMaker Studio 2 in order to open the project and make changes.  
For contributions, please open a pull request.

### Website<a name="website"></a>
For everything else, please visit the [website](https://opennbs.org/).
