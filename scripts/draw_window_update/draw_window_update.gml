// draw_window_update()
var x1, y1, a, n, fullstr, str, strb;
x1 = floor(window_width / 2 - 250)
y1 = floor(window_height / 2 - 200)
draw_window(x1, y1, x1 + 500, y1 + 400)
draw_set_font(fnt_mainbold)
if (window = w_update) draw_text(x1 + 8, y1 + 8, "Update")
else draw_text(x1 + 8, y1 + 8, "Changelist")
draw_set_font(fnt_main)
if (window = w_update) draw_text(x1 + 32, y1 + 32, "Thank you for upgrading to version " + version + "!")
draw_area(x1 + 16, y1 + 58, x1 + 487, y1 + 310)
fullstr = ""
fullstr +=  "Changes in v3.7.1 (2020.01.20):\n* Added an auto-updater. When a new version is available, Note Block Studio\nwill now be able to download and install it automatically. You don't even need\nto open your browser!\n* Pressing Shift while clicking 'Select all note blocks in this layer' will add those\nnotes to the selection rather than clearing it.\n* Holding Shift while dragging layer volumes/stereo will change them in\nincrements of 1, allowing a finer control.\n* Note panning is now prioritized over layer panning. Layers that haven't had\ntheir panning changed will not have any effect on note panning.\n* Re-added the option to import instruments from another song.\n* Bugfixes and improvements:\n   * Fixed layer volume and stereo controls being too sensitive.\n   * Fixed selection being automatically cleared once every minute.\n   * Fixed contents of macro windows not being shown in some circumstances,\nforcing you to quit the program.\n   * Fixed MIDI import setting pitch of all notes to +1.\n   * Fixed lower notes not playing all the way through/stopping too early.\n   * Fixed note count on 'Song stats' not being reset when creating a new song\n(and showing wrong percentages).\n   * Fixed a crash when redoing a manual block placement.\n   * Fixed a crash when opening the program with the greeting window disabled.\n   * Fixed long recent file names overflowing the greeting window.\n   * Fixed song area height being calculated incorrectly when the piano is\ndisabled.\n   * Improved contrast of various pieces of text in the dark theme.\n   * Removed the ability to drag the layer stereo controls with a window open.\n\n"
fullstr +=  "Changes in v3.7.0 (2019.12.31):\n* Added a cool demo song to showcase the new features in 3.7.0!\n* It's now possible to set velocity, panning and detune on each individual note.\n* Added a metronome.\n* Added an option to display tempo as BPM rather than t/s.\n* Auto-save is now a global preference rather than being saved per song.\n* Added an auto-recovery feature so work is not lost if the program crashes.\n* Added Patterns. You can export note block data as a pattern, and import it\ninto whatever song you wish.\n* Note block songs now save song looping.\n* Added a bars/beats/sixteenths display.\n* Added lines that mark each bar in a song.\n* Added an option to choose if looping should wait for the end of the bar.\n* Added an option to show or hide layer boxes.\n* Added four edit modes, which allow you to change different properties of\nnotes (key/velocity/panning/pitch).\n* Holding Shift while scrolling over a note will change a whole octave, or\nfine-tune its velocity/panning/pitch.\n* Added Macros:\n(Accessible by right-clicking a selection, or from the new macro bar)\n   * Tremolo\n   * Stereo\n   * Arpeggio\n   * Portamento\n   * Vibrato\n   * Stagger\n   * Chorus\n   * Volume LFO\n   * Fade in\n   * Fade out\n   * Replace key\n   * Set velocity\n   * Set panning\n   * Set pitch\n* Added branch export, a new layout for exporting as schematics.\n* Added a metronome function.\n* Added layer management buttons (shift layers up and down, insert, delete).\n* Added a secret clipboard editor for power users.\n* (Slightly) Improved MIDI import, and made it support note velocity.\n* Improved data pack performance; impact on tick rate should be negligible.\n* Data packs can now export notes outside the octave range by providing\na resource pack.\n* Data packs can now be exported as ZIP.\n* Data packs now allow any tempo to be imported into Minecraft.\n* It's now possible to set a custom namespace and path for data pack functions.\n* Added six types of visualizers to data packs.\n* Double-clicking a NBS file will now open the song.\n* Added the ability to export songs in previous NBS format versions\nvia the Save Options window.\n* Note Block Studio will now refuse to load NBS versions made in the future.\n* NBS format updated to version 4.\n* Improved contrast of layer icons in dark theme.\n* Prevented dragging layer stereo from changing the song tempo.\n* Fixed 'Keys to show' resetting to 20 when enabling the piano.\n* Fixed crash in MP3 and data pack export.\n* Fixed crash on opening after updating.\n* Fixed memory leak from audio emitters piling up.\n\n"
fullstr +=  "Changes in v3.6.0 (2019.08.08):\n* Added MP3 export option to select whether you want to include\n   locked layers.\n* Added loop button to loop the current song.\n* Readded colored note blocks, added option for the shaped ones.\n* Added option to toggle piano visibility.\n* Updated icon.\n* NBS format updated to version 3. Now stores song length again.\n* Fixed an issue where there was an unintended gradient over sprites.\n* Fixed typo in preferences.\n* Fixed instrument icons being blank.\n* Fixed preferences not saving.\n\n"
fullstr +=  "Changes in v3.5.1 (2019.07.14):\n* Fixed MIDI Import crash\n\n"
fullstr +=  "Changes in v3.5.0 (2019.07.11):\n* Added Stereo.\n* Stereo added to Datapack Export.\n* Improved MIDI import, again.\n* Added settings to enhance performance.\n *Added new sprites for note blocks.\n\n"
fullstr +=  "Changes in v3.4.0 (2019.05.11):\n* Added dark theme.\n* Datapack export: added option to let nearby players hear your music too.\n* Improved MIDI import.\n* NBS format now stores its version for future proofing. This means that\n   songs made here can't be opened in older versions of Note Block Studio.\n\n"
fullstr += "Changes in v3.3.8 (2019.03.21):\n* Fixed a glitch with layer names.\n* Fixed a glitch with compatibility indicator.\n\n"
fullstr += "Changes in v3.3.7 (2019.03.13):\n* Changed fonts.\n* Added support for cyrillic characters.\n* Updated desktop icon.\n* Fixed crash while checking for updates.\n\n"
fullstr += "Changes in v3.3.6 (2019.03.02):\n* Added new note block sounds: Iron Xylophone, Cow Bell, Didgeridoo,\n   Bit, Banjo and Pling.\n* Updated icon.\n* Updated note block texture\n\n"
fullstr += "Changes in v3.3.5 (2019.01.20):\n* Added option to export song as datapack. File -> Export as Datapack\n\n"
fullstr += "Changes in v3.3.4 (2018.02.01):\n* Fixed a crash when importing certain MIDI files.\n\n"
fullstr += "Changes in v3.3.3 (2017.06.10):\n* Stability fixes.\n\n"
fullstr += "Changes in v3.3.2 (2017.06.02):\n* Added new note block sounds: Guitar, Flute, Bell, Chime and Xylophone.\n* Added new blocks to the schematic exporter.\n* Added an option to export schematics for old Minecraft versions.\n* Fixed an audio stuttering bug for imported sounds.\n\n"
fullstr += "Changes in v3.3.1 (2017.03.25):\n* Schematics fixed for new Minecraft entity names.\n* Error fixed when importing MIDIs.\n\n"
fullstr += "Changes in v3.3.0 (2016.03.20):\n* MP3 export (MIDI export removed).\n* New blocks when exporting schematic.\n* Red outline around invalid blocks.\n* Piano renamed to Harp.\n* Improved performance.\n* New audio engine.\n* Schematic height limit increased to 256.\n\n"
fullstr += "Changes in v3.2.1 (2013.10.27):\n* Added 20 new songs.\n* Fixed a glitch with the info box.\n\n"
fullstr += "Changes in v3.2.0 (2013.10.26):\n* Added support for MIDI devices.\n* Added recording button.\n* Better text boxes.\n* Better menus.\n* Fixed an error in the help file.\n\n"
fullstr += "Changes in v3.1.3 (2012.04.01):\n* Fixed a glitch when creating Minecart schematics with more than one layer.\n* Added option to change the sound system, for users with audio problems.\n\n"
fullstr += "Changes in v3.1.2 (2012.03.20):\n* 2.5 and 5 tick / second songs are now compatible with Minecraft.\n* Removed support for Minecraft versions below 1.8.1.\n* Compress selection feature (found in the edit menu.)\n* Ctrl to add new blocks to a selection, Alt to clone.\n\n"
fullstr += "Changes in v3.1.1 (2011.12.03):\n* Schematic exporting updated to v1.0.0 of Minecraft.\n* Added list of changes upon startup of new version.\n* Custom instruments can now be in the .wav and .mp3 format.\n* Fixed a few grammatical errors in the help file.\n\n"
fullstr += "Changes in v3.1.0 (2011.11.05):\n* Added links to tutorial videos in the program and help file.\n* You will now need to hold Shift while selecting to add blocks to the selection.\n* Fixed some issues with looping the song when exporting as Schematic.\n* Slight performance boosting.\n* Removed an old debugging feature.\n* Fixed a glitch with redoing a selection.\n* Fixed some rounding errors when drawing shapes."
n = string_count("\n", fullstr) 
for (a = 0; a < n; a += 1) {
    str[a] = string_copy(fullstr, 1, string_pos("\n", fullstr) - 1)
    strb[a] = 0
    if (string_char_at(str[a], 1) = "C") strb[a] = 1
    fullstr = string_delete(fullstr, 1, string_pos("\n", fullstr))
}
for (a = sb_val[update_scrollbar]; a < sb_val[update_scrollbar] + 15; a += 1) {
    if (a >= n) break
    if (strb[a]) draw_set_font(fnt_mainbold)
    else draw_set_font(fnt_main)
    draw_text(x1 + 32, y1 + 64 + 16 * (a - sb_val[update_scrollbar]), str[a])
}
draw_set_font(fnt_main)
draw_scrollbar(update_scrollbar, x1 + 470, y1 + 60, 12, 18, n, 0, 1)
if (draw_button2(x1 + 220, y1 + 340, 72, "OK")) {
    if (window = w_update) {
        window = w_greeting
    } else {
        window = 0
    }
}
