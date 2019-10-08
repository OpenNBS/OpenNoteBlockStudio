---
permalink: /nbs
---

<section id="banner">
	<h2>NBS Format</h2>
	<p></p>
</section>
<!-- One -->
<section id="one" class="wrapper style1">
	<div class="container">	
		<div class="row">
			<div class="col-md-7">
				<h2>About NBS</h2>
				<p>
					The .nbs format (Note Block Song) was made mainly for the Minecraft Note Block Studio, and contains data about how note blocks are laid out in the program to form a song. <br><br> To make Note Block Studio work better and to make it futureproof, we are using an improved format.<br>The first 2 bytes of the .nbs file have been changed to 0 to indicate this new format.<br><br>
					All the data types found in a .nbs file are <a href="http://en.wikipedia.org/wiki/Signedness" target="_blank">signed</a>, and in <a href="http://en.wikipedia.org/wiki/Endianness" target="_blank">little endian</a>. Strings consist of a 32-bit integer, and then that many bytes for the characters. The file is made up of four parts, two of which are mandatory:
				</p>
				<ol>
					<li>Header</li>
					<li>Note blocks</li>
					<li>Layers (Optional)</li>
					<li>Custom instruments (Optional)</li>
				</ol>
				<p>
					<span>If the information provided below differs from the old .nbs format, they are marked </span> <strong><span style="color: #01cc01c7">Green</span></strong>.
				</p><br>
			</div>
			<div class="col-md-5">
				<h2>NBS Changelog</h2>
				<div>
					<strong>Version 4.0:</strong> 
					<ul><li>Loop On/Off and Loop Start Tick are now saved.</li><li>Note blocks now store velocity, panning, and pitch. These work in conjunction with layer volume and layer stereo.</li></ul>
					<strong>Version 3.0:</strong> 
					<ul><li>Song length is now saved again after the Vanilla Note Block Instruments count.</li></ul>
					<strong>Version 2.0:</strong> 
					<ul><li>Now stereo information is saved for each layer. This means that now the sound can pan to the left/right.</li><li>For every layer, there's now a byte that determines how much that layer pans.<br>0 is 2 blocks right, 100 is centre, 200 is 2 blocks left.</li></ul>
					<strong>Version 1.0 (initial version):</strong> 
					<ul><li>The byte after the .nbs version is now the amount of vanilla instruments.<br>
					This change was necessary, because previously the program didn't know when the custom instruments began. It always just went up to 9, and everything after that was treated as a custom instrument.</li></ul>
				</div>
			</div>
		</div>	
	</div>
</section>
<!-- Two -->
<section id="two" class="wrapper style2">
	<div class="container">	
		<h2>Part 1: Header</h2>
		<p>The header contains information about the file, all the data must be in the following order:</p>
		<div class="table-wrapper">
			<table class="alt">
				<thead>
					<tr>
						<th>Type</th>
						<th>Name</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<tr class="newversion">
						<td>Short</td>
						<td></td>
						<td>The first 2 bytes are always zero. In the old nbs format, this used to be song length, which can never be zero.<br> 
						(So this is how you can check whether a .nbs file is using the new format)</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>NBS version</td>
						<td>The version of the new NBS format.</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>Vanilla Note Block Instruments count</td>
						<td>Amount of Vanilla Note Block Instruments, this is needed to determine at what index custom instruments start.</td>
					</tr>
					<tr class="newversion">
						<td>Short</td>
						<td>Song length</td>
						<td>The length of the song, measured in ticks. Divide this by the tempo to get the length of the song in seconds. The Note Block Studio doesn't really care about this value, the song size is calculated in the second part.<br>
						(Note that this was re-added in nbs version 3)</td>
					</tr>
					<tr>
						<td>Short</td>
						<td>Layer count</td>
						<td>The last layer with at least one note block in it, or the last layer that have had its name or volume changed.</td>
					</tr>
					<tr>
						<td>String</td>
						<td>Song name</td>
						<td>The name of the song.</td>
					</tr>
					<tr>
						<td>String</td>
						<td>Song author</td>
						<td>The author of the song.</td>
					</tr>
					<tr>
						<td>String</td>
						<td>Song original author</td>
						<td>The original author of the song.</td>
					</tr>
					<tr>
						<td>String</td>
						<td>Song description</td>
						<td>The description of the song.</td>
					</tr>
					<tr>
						<td>Short</td>
						<td>Song tempo</td>
						<td>The tempo of the song multiplied by 100 (1225 instead of 12.25 for example). This is measured in ticks per second.</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Auto-saving</td>
						<td>Whether auto-saving has been enabled (0 or 1).</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Auto-saving duration</td>
						<td>The amount of minutes between each auto-save (if it has been enabled) (1-60).</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Time signature</td>
						<td>The time signature of the song. If this is 3, then the signature is 3/4. Default is 4. This value ranges from 2-8.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Minutes spent</td>
						<td>The amount of minutes spent on the project.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Left clicks</td>
						<td>The amount of times the user have left clicked.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Right clicks</td>
						<td>The amount of times the user have right clicked.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Note blocks added</td>
						<td>The amount of times the user have added a note block.</td>
					</tr>
					<tr>
						<td>String</td>
						<td>MIDI/Schematic file name</td>
						<td>If the song has been imported from a .mid or .schematic file, that file name is stored here (Only the name of the file, not the path).</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>Loop On/Off</td>
						<td>Whether looping is on or off. (0 = off, 1 = on)</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>Loop Start Tick</td>
						<td>Determines which part of the song (in ticks) it loops back to.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<h2>Part 2: Note blocks</h2>
		<p>The next part contains the information about how the note blocks are placed, what instruments they have and what note. As you may or may not know, the song is divided into ticks (horizontally) and layers (vertically). Often, a majority of the ticks and layers in the song are empty, which is why we specify the amount of "jumps" to the next active tick or layer, rather than just a bunch of empty slots.<br><br>
		The pattern of the note block format is as follows:</p>
		<div class="table-wrapper">
			<table class="alt">
				<thead>
					<tr>
						<th>Type</th>
						<th>Name</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Short</td>
						<td>Jumps to the next tick</td>
						<td>The amount of "jumps" to the next tick with at least one note block in it. We start at tick -1. If the amount of jumps is 0, the program will stop reading and proceed to the next part.</td>
					</tr>
					<tr>
						<td>Short</td>
						<td>Jumps to the next layer</td>
						<td>Once we have found an active tick, we read the amount of vertical jumps to the next layer. We start at layer -1. If this is 0, we go back to Step 1. If not, we have found a note block!</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Note block instrument</td>
						<td>The instrument of the note block. This is 0-15, or higher if the song uses custom instruments.<br>
							<strong>0 = </strong>Piano (Air)<br>
							<strong>1 = </strong>Double Bass (Wood)<br>
							<strong>2 = </strong>Bass Drum (Stone)<br>
							<strong>3 = </strong>Snare Drum (Sand)<br>
							<strong>4 = </strong>Click (Glass)<br>
							<strong>5 = </strong>Guitar (Wool)<br>
							<strong>6 = </strong>Flute (Clay)<br>
							<strong>7 = </strong>Bell (Block of Gold)<br>
							<strong>8 = </strong>Chime (Packed Ice)<br>
							<strong>9 = </strong>Xylophone (Bone Block)<br>
							<span class="newversion">
								<strong>10 = </strong>Iron Xylophone (Iron Block)<br>
								<strong>11 = </strong>Cow Bell (Soul Sand)<br>
								<strong>12 = </strong>Didgeridoo (Pumpkin)<br>
								<strong>13 = </strong>Bit (Block of Emerald)<br>
								<strong>14 = </strong>Bajo (Hay)<br>
								<strong>15 = </strong>Pling (Glowstone)
							</span>
						</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Note block key</td>
						<td>The key of the note block, from 0-87, where 0 is A0 and 87 is C8. 33-57 is within the 2 octave limit.</td></tr>
					<tr>
						<span class="newversion"> 
						<td>Byte</td>
						<td>Note block velocity</td>
						<td>The velocity/volume of the note block, from 0% to 100%.</td>
					</tr>
						<td>Byte</td>
						<td>Note block panning</td>
						<td>The stereo position of the note block, from 0-200. 100 is center panning.</td>
					<tr>
						<td>Short (Signed)</td>
						<td>Note block pitch</td>
						<td>The fine pitch of the note block, from -32,768 to 32,767 cents (but the max in Note Block Studio is limited to -1200 and +1200). 0 is no fine tuning. +-100 cents is a single semitone difference. After reading this, we go back to Step 2.</td>
						</span>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<h2>Part 3: Layers</h2>
		<p>
			This part is optional. You can choose to stop writing here and the Note Block Studio will still load the song.
			However, you cannot simply jump to the next part.<br>
			<br>
			Here the information about the layers are stored, which in this case are the layer names, their volumes and their stereo. These values are repeated the same number of layers there are (the song height, specified at the beginning of the file):
		</p>
		<div class="table-wrapper">
			<table class="alt">
				<thead>
					<tr>
						<th>Type</th>
						<th>Name</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>String</td>
						<td>Layer name</td>
						<td>The name of the layer.</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Layer volume</td>
						<td>The volume of the layer (percentage). Ranges from 0-100.</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>Layer stereo</td>
						<td>How much this layer is panned to the left/right. 0 is 2 blocks right, 100 is centre, 200 is 2 blocks left</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<h2>Part 4: Custom instruments</h2>
		<p>Finally, the custom instruments of the song are stored. Like the previous part, this is optional. You can stop writing here and the song will still be loaded.<br><br>
			A song can have a maximum of <span class="newversion">18</span> custom instruments, each with a name and sound file assigned to it. The sound file must be located in the /Sounds folder of the Minecraft Note Block Studio directory.
		Before we begin, we need to know the amount of custom instruments:</p>
		<div class="table-wrapper">
			<table class="alt">
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
						<td style="text-align: left">The amount of custom instruments (0-<span class="newversion">18</span>).</td>
					</tr>
				</tbody>
			</table>
		</div><br> 
		<p>The next four values are repeated the number of custom instruments:</p>
		<div class="table-wrapper">
			<table class="alt">
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
			</table>
		</div>
	</div>
</section>
