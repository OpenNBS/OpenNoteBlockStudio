//dat_generate(functionpath, functiondir, objective, zipfile)
var o, s, file, zipfile, functionpath, functiondir, objective, str, instrument, soundname, pitch, source, blockvolume, blockposition
o = obj_controller

source = o.dat_source
functionpath = argument0
functiondir = argument1
objective = argument2
zipfile = argument3
str = ""
for (a = 0; a <= o.enda; a++) { 	
	if (o.colamount[a] > 0) {
		str = ""
	    for (b = 0; b <= o.collast[a]; b += 1) {
	        if (o.song_exists[a, b] && (o.lockedlayer[b] = 0 || o.dat_includelocked)) {
	            if (o.song_key[a, b] > 32 && o.song_key[a, b] < 58 || (o.dat_includeoutofrange && o.song_key[a, b] >= 9 && o.song_key[a, b] <= 81)) {
	                instrument = dat_instrument(ds_list_find_index(other.instrument_list, o.song_ins[a, b]))
	                pitch = dat_pitch(o.song_key[a, b])
					blockvolume = o.layervol[b]/100
					s = o.layerstereo[b] // Stereo values to X coordinates
					if s > 100 blockposition=(s-100)/-100
					if s = 100 blockposition=0
					if s < 100 blockposition=((s-100)*-1)/100
					
					// Append -1 or 1 to sound event if note is out of range
					soundname = instrument
					if (o.song_key[a, b] <= 32) soundname += "_-1"
					else if (o.song_key[a, b] >= 58) soundname += "_1"
					
					// Add command to result
					if(o.dat_enableradius) str += "execute at @s run playsound "+ soundname +" "+source+" @a ~ ~ ~ " + string(o.dat_radiusvalue) + " " + string(pitch) + br 
					else str += "playsound "+ soundname +" "+source+" @s ^" + string(blockposition*2) + " ^ ^ "+string(blockvolume)+ " " + string(pitch) + " 1" + br	
	            }
	        }
		}
		if(a < o.enda) str += "scoreboard players set @s " + objective + "_t " + string(a+1)
		else { // Last tick
			if(o.dat_enablelooping) {
				str += "scoreboard players set @s " + objective + " " + string(o.dat_loopstart*80-79) + br
				str += "scoreboard players set @s " + objective + "_t " + string(o.dat_loopstart)
			}
			else str += "execute if score @s " + objective + " matches " + string(a+1) + " run function " + functionpath + "stop"
		}
		dat_writefile(str, functiondir + "notes/" + string(a+1) + ".mcfunction", zipfile)
	}
 }
 
// Generate binary tree to find the correct tick
var length, steps, pow, searchrange, segments, half, lower, min1, max1, min2, max2
length = o.enda
steps = floor(log2(length)) + 1
pow = power(2, steps)
for (step = 0; step < steps; step++) {
	searchrange = floor(pow / power(2, step))
	segments = floor(pow / searchrange)
	for (segment = 0; segment < segments; segment++) {
		str = ""
		half = floor(searchrange / 2)
		lower = searchrange * segment
		
		min1 = lower + 1
		max1 = lower + half
		min2 = lower + half + 1
		max2 = lower + searchrange
		
		// show_debug_message(string(step) + " " + string(segments) + "    " + string(min1) + " " + string(max1) + " " + string(min2) + " " + string(max2))
		
		if (min1 <= length) {
			if (step == steps-1) { // Last step, play the tick
				str += "execute as @s[scores={" + objective + "=" + string(min1*80-79) + ".." + string(max1*80) + "," + objective + "_t=.." + string(min1-1) + "}] run function " + functionpath + "notes/" + string(min1) + br
				str += "execute as @s[scores={" + objective + "=" + string(min2*80-79) + ".." + string(max2*80) + "," + objective + "_t=.." + string(min2-1) + "}] run function " + functionpath + "notes/" + string(min2) + br
			}
			else { // Don't play yet, refine the search
				str += "execute as @s[scores={" + objective + "=" + string(min1*80-79) + ".." + string(max1*80) + "}] run function " + functionpath + "tree/" + string(min1) + "_" + string(max1) + br
				str += "execute as @s[scores={" + objective + "=" + string(min2*80-79) + ".." + string(max2*80) + "}] run function " + functionpath + "tree/" + string(min2) + "_" + string(max2) + br
			}
			dat_writefile(str, functiondir + "tree/" + string(min1) + "_" + string(max2) + ".mcfunction", zipfile)
		}
	}
 }
