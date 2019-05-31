//dat_generate(name)
//Returns: string
var o, objective, str, note, instrument, pitch, tick, source, name, blockvolume
o = obj_controller
objective = o.dat_obj
source = o.dat_source
name = argument0
str = "scoreboard players add @s " + objective + " 1" + br
tick = 1

for (a = 0; a <= o.enda; a ++) { 	
	if (o.colamount[a] > 0) { 
	    for (b = 0; b <= o.collast[a]; b += 1) {
	        if (o.song_exists[a, b] && (o.lockedlayer[b] = 0 || o.dat_includelocked)) {
	            if (o.song_key[a, b] > 32 && o.song_key[a, b] < 58) {
	                instrument = dat_instrument(ds_list_find_index(other.instrument_list, o.song_ins[a, b]))			
	                pitch = dat_pitch(o.song_key[a, b])
			blockvolume = o.layervol[b]/100
					
					//Add command to result
					if(o.dat_enableradius) str += "execute at @s[scores={"+objective+"="+string(tick)+"}] run playsound "+ instrument +" "+source+" @a ~ ~ ~ " + string(o.dat_radiusvalue) + " " + string(pitch) + br 
					else str += "playsound "+ instrument +" "+source+" @s[scores={"+objective+"="+string(tick)+"}] ~ ~ ~ "+string(blockvolume)+ " " + string(pitch) + " 1" + br	
	            }
	        }
		}			 
	}	
	tick += o.dat_tempo
 }
str += "execute if score @s "+objective+" matches "+string(tick)+" run function "+ name +":stop"
return str
