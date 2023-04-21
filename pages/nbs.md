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
					The .nbs format (Note Block Song) was created to work with Minecraft Note Block Studio, and contains data about how note blocks are laid out in the program to form a song. <br><br> To bring new features to Note Block Studio and make it future-proof, we are using an improved file format. The first 2 bytes of the .nbs file have been changed to 0 to indicate the new format.<br><br>
					Unless specified otherwise, the data types found in a .nbs file are <a href="http://en.wikipedia.org/wiki/Signedness" target="_blank">signed</a>, and in <a href="http://en.wikipedia.org/wiki/Endianness" target="_blank">little-endian</a>. Strings consist of a 32-bit integer, and then that many bytes for the characters. The file is made up of four parts, two of which are mandatory:
				</p>
				<ol>
					<li><a href="/nbs#part1">Header</a></li>
					<li><a href="/nbs#part2">Note blocks</a></li>
					<li><a href="/nbs#part3">Layers</a> (Optional)</li>
					<li><a href="/nbs#part4">Custom instruments</a> (Optional)</li>
				</ol>
				<p>
					<span>If the information provided below differs from the old .nbs format, they are marked </span> <strong><span style="color: #01cc01c7">Green</span></strong>.
				</p><br>
			</div>
			<div class="col-md-5">
				<h2>NBS Changelog</h2>
				<div>
					<strong>Version 5:</strong>
					<ul><li>May now hold up to 240 custom instruments, previously 18.</li>
					<li>The path to custom sound files may contain slash characters, as a result of allowing custom sounds to be loaded from subfolders.</li>
					<li>No fields have been added or removed, so version 5 files may be read identically to version 4.</li></ul>
					<strong>Version 4:</strong> 
					<ul><li>Loop on/off, max loop count, and loop start tick are now saved.</li><li>The program now saves which layers are locked.</li><li>Note blocks now store velocity, panning, and pitch. These work in conjunction with layer volume and layer stereo.</li></ul>
					<strong>Version 3:</strong> 
					<ul><li>Song length is now saved again after the vanilla instrument count.</li></ul>
					<strong>Version 2:</strong>
					<ul><li>Now stereo information is saved for each layer. This means that now the sound can pan to the left/right.</li><li>For every layer, there's now a byte that determines how much that layer pans.<br>0 is 2 blocks right, 100 is centre, 200 is 2 blocks left.</li></ul>
					<strong>Version 1:</strong> 
					<ul><li>The first two bytes, which used to indicate the song length, have been changed to 0 to indicate the new format.</li>
					<li>The NBS version is now stored in the file.</li>
					<li>The byte after the NBS version is now the amount of vanilla instruments.<br>
					This change was necessary because, previously, the program didn't know when the custom instruments began. It always went up to 9, and everything after that was treated as a custom instrument.</li></ul>
					<strong>Classic (Version 0):</strong> 
					<ul><li>This version is used by the original Minecraft Note Block Studio, which precedes the transition to Open Note Block Studio. You can find the original specification <a href="https://www.stuffbydavid.com/mcnbs/format" target="_blank">here</a>.</li>					
					</ul>
				</div>
			</div>
		</div>	
	</div>
</section>
<!-- Two -->
<section id="two" class="wrapper style2">
	<div class="container">	
		<h2 id="part1">Part 1: Header</h2>
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
						<td>The first 2 bytes are always zero. In the old NBS format, this used to be song length, which can never be zero.<br> 
						This is how you can check whether a .nbs file is using the new format.</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>NBS version</td>
						<td>The version of the new NBS format.</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>Vanilla instrument count</td>
						<td>Amount of default instruments when the song was saved. This is needed to determine at what index custom instruments start.</td>
					</tr>
					<tr class="newversion">
						<td>Short</td>
						<td>Song length</td>
						<td>The length of the song, measured in ticks. Divide this by the tempo to get the length of the song in seconds. Note Block Studio doesn't really care about this value, the song size is calculated in the second part.<br>
						(Note: this was re-added in NBS version 3)</td>
					</tr>
					<tr>
						<td>Short</td>
						<td>Layer count</td>
						<td>The last layer with at least one note block in it, or the last layer that has had its name, volume or stereo changed.</td>
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
						<td>The tempo of the song multiplied by 100 (for example, 1225 instead of 12.25). Measured in ticks per second.</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Auto-saving</td>
						<td>Whether auto-saving has been enabled (0 or 1). As of NBS version 4 this value is still saved to the file, but no longer used in the program.</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Auto-saving duration</td>
						<td>The amount of minutes between each auto-save (if it has been enabled) (1-60). As of NBS version 4 this value is still saved to the file, but no longer used in the program.</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Time signature</td>
						<td>The time signature of the song. If this is 3, then the signature is 3/4. Default is 4. This value ranges from 2-8.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Minutes spent</td>
						<td>Amount of minutes spent on the project.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Left-clicks</td>
						<td>Amount of times the user has left-clicked.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Right-clicks</td>
						<td>Amount of times the user has right-clicked.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Note blocks added</td>
						<td>Amount of times the user has added a note block.</td>
					</tr>
					<tr>
						<td>Integer</td>
						<td>Note blocks removed</td>
						<td>The amount of times the user have removed a note block.</td>
					</tr>
					<tr>
						<td>String</td>
						<td>MIDI/Schematic file name</td>
						<td>If the song has been imported from a .mid or .schematic file, that file name is stored here (only the name of the file, not the path).</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>Loop on/off</td>
						<td>Whether looping is on or off. (0 = off, 1 = on)</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>Max loop count</td>
						<td>0 = infinite. Other values mean the amount of times the song loops.</td>
					</tr>
					<tr class="newversion">
						<td>Short</td>
						<td>Loop start tick</td>
						<td>Determines which part of the song (in ticks) it loops back to.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<h2 id="part2">Part 2: Note blocks</h2>
		<p>The next part contains the information about how the note blocks are placed, what instruments they have and what note. As you may know, the song is divided into ticks (horizontally) and layers (vertically). Often, a majority of the ticks and layers in the song are empty, which is why we specify the amount of "jumps" to the next active tick or layer, rather than just a bunch of empty slots.<br><br>
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
						<td>Once we have found an active tick, we read the amount of vertical jumps to the next layer. We start at layer -1. If this is 0, we go back to step 1. If not, we have found a note block!</td>
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
								<strong>14 = </strong>Banjo (Hay)<br>
								<strong>15 = </strong>Pling (Glowstone)
							</span>
						</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Note block key</td>
						<td>The key of the note block, from 0-87, where 0 is A0 and 87 is C8. 33-57 is within the 2-octave limit.</td>
					</tr>
					<tr class="newversion"> 
						<td>Byte</td>
						<td>Note block velocity</td>
						<td>The velocity/volume of the note block, from 0% to 100%.</td>
					</tr>
					<tr class="newversion">
						<td>Byte (unsigned)</td>
						<td>Note block panning</td>
						<td>The stereo position of the note block, from 0-200. 0 is 2 blocks right, 100 is center, 200 is 2 blocks left.</td>
					</tr>
					<tr class="newversion">
						<td>Short</td>
						<td>Note block pitch</td>
						<td>The fine pitch of the note block, from -32,768 to 32,767 cents (but the max in Note Block Studio is limited to -1200 and +1200). 0 is no fine-tuning. ±100 cents is a single semitone difference. After reading this, we go back to step 2.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<h2 id="part3">Part 3: Layers</h2>
		<p>
			This part is optional. You can choose to stop writing here and the Note Block Studio will still load the song.
			However, you cannot simply jump to the next part.<br>
			<br>
			Here the information about the layers are stored, which includes their name, volume and stereo. These values are repeated the same number of layers in the song (the song height, specified in the header):
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
					<tr class="newversion">
						<td>Byte</td>
						<td>Layer lock</td>
						<td>Whether or not this layer has been marked as locked. 1 = locked.</td>
					</tr>
					<tr class="newversion">
						<td>Byte</td>
						<td>Layer volume</td>
						<td>The volume of the layer (percentage). Ranges from 0-100.</td>
					</tr>
					<tr class="newversion">
						<td>Byte (unsigned)</td>
						<td>Layer stereo</td>
						<td>How much this layer is panned to the left/right. 0 is 2 blocks right, 100 is center, 200 is 2 blocks left.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<h2 id="part4">Part 4: Custom instruments</h2>
		<p>Finally, the custom instruments of the song are stored. Like the previous part, this is optional. You can stop writing here and the song will still be loaded.<br><br>
			A song can have a maximum of <span class="newversion">240</span> custom instruments, each with a name and sound file assigned to it. The sound file must be located in the /Sounds folder of the Minecraft Note Block Studio directory.
		Before we begin, we need to know the amount of custom instruments:</p>
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
						<td>Byte (unsigned)</td>
						<td>Custom instruments</td>
						<td>The amount of custom instruments (0-<span class="newversion">240</span>).</td>
					</tr>
				</tbody>
			</table>
		</div><br> 
		<p>The next four values are repeated the number of custom instruments:</p>
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
						<td>Instrument name</td>
						<td>The name of the instrument.</td>
					</tr>
					<tr>
						<td>String</td>
						<td>Sound file</td>
						<td>The sound file of the instrument (relative path from the /Sounds directory).</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Sound key</td>
						<td>The key of the sound file. Just like the note blocks, this ranges from 0-87. Default is 45 (F#4).</td>
					</tr>
					<tr>
						<td>Byte</td>
						<td>Press piano key</td>
						<td>Whether the piano should automatically press keys with this instrument when the marker passes them (0 or 1).</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</section>
<!-- Three -->
<section id="three" class="wrapper style1">
	<div class="container"> 
        <h2>Calculations</h2>
        <p>While processing the NBS file, the actual values of some properties must be calculated from multiple sources (typically layer and note).</p>
        <div>        
            <h3>Note volume</h3>
            <p>In Note Block Studio, each note can have its own velocity value. However, the actual volume of the note, when played, is affected according to the volume of the layer it's placed at. The following formula is used to achieve this behavior:</p>
            <code>(layer_volume * note_volume) / 100</code>
        </div>
        <div>
            <h3>Note panning</h3>
            <p>Similarly, the actual panning is also calculated from note and layer panning values.</p>
            <p>If the layer panning equals 100 (center), note panning is used without any modifications for playback. Otherwise, the following formula is applied:</p>
            <code>(layer_panning + note_panning) / 2</code>
        </div>
        <div>
            <h3>Note pitch</h3>
            <p>To calculate the actual pitch, it is necessary to combine its key and pitch (detune) using the following formula:</p>
            <code>(note_key * 100) + note_pitch</code>
        </div>
        <div>
            <h3>Custom instrument and note pitch</h3>
            <p>The audio file used for a custom instrument may be in a key other than F#4 (45), which is the center of Minecraft's 2-octave range and also the default value for all vanilla instruments. If that's the case, the final pitch of the played notes would not correspond to the pitch displayed in Note Block Studio. As such, the instrument's pitch must be taken into account while calculating the actual pitch of the played note. The final pitch is calculated using the following formula:</p>
            <code>note_key + instrument_key - 45 + (note_pitch / 100)</code>
        </div>
    </div>
</section>
