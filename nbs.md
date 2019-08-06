---
title: New NBS format
description: The .nbs format (Note Block Song) was made mainly for the Minecraft Note Block Studio, <br>and contains data about how note blocks are laid out in the program to form a song. <br><br> To make Note Block Studio work better and to make it futureproof, we are using an improved format.<br>The first 2 bytes of the .nbs file have been changed to 0 to indicate this new format.
permalink: /nbs/
---

<button data-toggle="collapse" data-target="#demo" class="btn btn-lg btn-block btn-primary">Show version changelog</button>

<div id="demo" class="collapse">

<strong>NBS version 3 changes:</strong> 
<p>Song length is now saved again after the Vanilla Note Block Instruments count</p>

<strong>NBS version 2 changes:</strong> 
<p>Now stereo information is saved for each layer. This means that now the sound can pan to the left/right.<br> For every layer, there's now a byte that determines how much that layer pans.<br>0 is 2 blocks right, 100 is centre, 200 is 2 blocks left.</p>

<strong>NBS version 1 changes:</strong> 
<p>The byte after the .nbs version is now the amount of vanilla instruments.<br>
This change was necessary, because previously the program didn't know when the custom instruments began. It always just went up to 9, and everything after that was treated as a custom instrument.<br>
(Probably because the original creator didn't think Mojang would add new sounds to note blocks :wink: )</p>
</div>


## About NBS
All the data types found in a .nbs file are <a href="http://en.wikipedia.org/wiki/Signedness" target="_blank">signed</a>, and in <a href="http://en.wikipedia.org/wiki/Endianness" target="_blank">little endian</a>. Strings consist of a 32-bit integer, and then that many bytes for the characters. The file is made up of four parts, two of which are mandatory:

1. Header
2. Note blocks
3. Layers (Optional)
4. Custom instruments (Optional)

<span>In the tables below the rows are marked</span> <strong><span style="color: #01cc01c7">Green</span></strong> <span>if this was added/changed by the new .nbs format.</span>

### Part 1: Header

The header contains information about the file, all the data must be in the following order:

<table>
  <thead>
    <tr>
      <th style="text-align: left">Type</th>
      <th style="text-align: left">Name</th>
      <th style="text-align: left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr class="newversion">
      <td style="text-align: left">Short</td>
      <td style="text-align: left"></td>
        <td style="text-align: left">The first 2 bytes are always zero. In the old nbs format, this used to be song lenght, which can never be zero.<br> 
        (So this is how you can check whether a .nbs file is using the new format)</td>
    </tr>
    <tr class="newversion">
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">NBS version</td>
      <td style="text-align: left">The version of the new NBS format.</td>
    </tr>
    <tr class="newversion">
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Vanilla Note Block Instruments count</td>
       <td style="text-align: left">Amount of Vanilla Note Block Instruments, this is needed to determine at what index custom instruments start.</td>
    </tr>
    <tr class="newversion">
      <td style="text-align: left">Short</td>
      <td style="text-align: left">Song length</td>
       <td style="text-align: left">The length of the song, measured in ticks. Divide this by the tempo to get the length of the song in seconds. The Note Block Studio doesn't really care about this value, the song size is calculated in the second part.<br>
       (Note that this was re-added in nbs version 3)</td>
    </tr>
    <tr>
      <td style="text-align: left">Short</td>
      <td style="text-align: left">Layer count</td>
       <td style="text-align: left">The last layer with at least one note block in it, or the last layer that have had its name or volume changed.</td>
    </tr>
    <tr>
      <td style="text-align: left">String</td>
      <td style="text-align: left">Song name</td>
      <td style="text-align: left">The name of the song.</td>
    </tr>
    <tr>
      <td style="text-align: left">String</td>
      <td style="text-align: left">Song author</td>
      <td style="text-align: left">The author of the song.</td>
    </tr>
    <tr>
      <td style="text-align: left">String</td>
      <td style="text-align: left">Song original author</td>
      <td style="text-align: left">The original author of the song.</td>
    </tr>
    <tr>
      <td style="text-align: left">String</td>
      <td style="text-align: left">Song description</td>
      <td style="text-align: left">The description of the song.</td>
    </tr>
    <tr>
      <td style="text-align: left">Short</td>
      <td style="text-align: left">Song tempo</td>
      <td style="text-align: left">The tempo of the song multiplied by 100 (1225 instead of 12.25 for example). This is measured in ticks per second.</td>
    </tr>
    <tr>
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Auto-saving</td>
      <td style="text-align: left">Whether auto-saving has been enabled (0 or 1).</td>
    </tr>
    <tr>
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Auto-saving duration</td>
      <td style="text-align: left">The amount of minutes between each auto-save (if it has been enabled) (1-60).</td>
    </tr>
    <tr>
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Time signature</td>
      <td style="text-align: left">The time signature of the song. If this is 3, then the signature is 3/4. Default is 4. This value ranges from 2-8.</td>
    </tr>
    <tr>
      <td style="text-align: left">Integer</td>
      <td style="text-align: left">Minutes spent</td>
      <td style="text-align: left">The amount of minutes spent on the project.</td>
    </tr>
    <tr>
      <td style="text-align: left">Integer</td>
      <td style="text-align: left">Left clicks</td>
      <td style="text-align: left">The amount of times the user have left clicked.</td>
    </tr>
    <tr>
      <td style="text-align: left">Integer</td>
      <td style="text-align: left">Right clicks</td>
      <td style="text-align: left">The amount of times the user have right clicked.</td>
    </tr>
    <tr>
      <td style="text-align: left">Integer</td>
      <td style="text-align: left">Note blocks added</td>
      <td style="text-align: left">The amount of times the user have added a note block.</td>
    </tr>
    <tr>
      <td style="text-align: left">String</td>
      <td style="text-align: left">MIDI/Schematic file name</td>
      <td style="text-align: left">If the song has been imported from a .mid or .schematic file, that file name is stored here (Only the name of the file, not the path).</td>
    </tr>
  </tbody>
</table>

### Part 2: Note blocks

<table>
  <thead>
    <tr>
      <th style="text-align: left">Type</th>
      <th style="text-align: left">Name</th>
      <th style="text-align: left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: left">Short</td>
      <td style="text-align: left">Jumps to the next tick</td>
        <td style="text-align: left">The amount of "jumps" to the next tick with at least one note block in it. We start at tick -1. If the amount of jumps is 0, the program will stop reading and proceed to the next part.</td>
    </tr>
    <tr>
      <td style="text-align: left">Short</td>
      <td style="text-align: left">Jumps to the next layer</td>
      <td style="text-align: left">Once we have found an active tick, we read the amount of vertical jumps to the next layer. We start at layer -1. If this is 0, we go back to Step 1. If not, we have found a note block!</td>
    </tr>
  </tbody>
</table>

### Part 3: Layers

This part is optional. You can choose to stop writing here and the Note Block Studio will still load the song.
However, you cannot simply jump to the next part.

Here the information about the layers are stored, which in this case are the layer names, their volumes and their stereo. These values are repeated the same number of layers there are (the song height, specified at the beginning of the file):

<table>
  <thead>
    <tr>
      <th style="text-align: left">Type</th>
      <th style="text-align: left">Name</th>
      <th style="text-align: left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: left">String</td>
      <td style="text-align: left">Layer name</td>
        <td style="text-align: left">The name of the layer.</td>
    </tr>
    <tr>
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Layer volume</td>
      <td style="text-align: left">The volume of the layer (percentage). Ranges from 0-100.</td>
    </tr>
    <tr class="newversion">
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Layer stereo</td>
      <td style="text-align: left">How much this layer is panned to the left/right. 0 is 2 blocks right, 100 is centre, 200 is 2 blocks left</td>
    </tr>
  </tbody>
</table>

### Part 4: Custom instruments

Finally, the custom instruments of the song are stored. Like the previous part, this is optional. You can stop writing here and the song will still be loaded.

A song can have a maximum of 18 custom instruments, each with a name and sound file assigned to it. The sound file must be located in the /Sounds folder of the Minecraft Note Block Studio directory.

Before we begin, we need to know the amount of custom instruments:
<table>
  <thead>
    <tr>
      <th style="text-align: left">Type</th>
      <th style="text-align: left">Name</th>
      <th style="text-align: left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Custom instruments</td>
        <td style="text-align: left">The amount of custom instruments (0-18).</td>
    </tr>
  </tbody>
</table><br> 
The next four values are repeated the number of custom instruments:

<table>
  <thead>
    <tr>
      <th style="text-align: left">Type</th>
      <th style="text-align: left">Name</th>
      <th style="text-align: left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: left">String</td>
      <td style="text-align: left">Instrument name</td>
      <td style="text-align: left">The name of the instrument.</td>
    </tr>
    <tr>
      <td style="text-align: left">String</td>
      <td style="text-align: left">Sound file</td>
      <td style="text-align: left">The sound file of the instrument (just the filename, not the path).</td>
    </tr>
    <tr>
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Sound pitch</td>
      <td style="text-align: left">The pitch of the sound file. Just like the note blocks, this ranges from 0-87. Default is 45.</td>
    </tr>
    <tr>
      <td style="text-align: left">Byte</td>
      <td style="text-align: left">Press key</td>
      <td style="text-align: left">Whether the piano should automatically press keys with this instrument when the marker passes them (0 or 1).</td>
    </tr>
  </tbody>
</table><br> 