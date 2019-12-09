// datapack_export()
var fn, o
o = obj_controller

if (o.dat_usezip) fn = string(get_save_filename_ext("ZIP archive (*.zip)|*.zip", dat_name + ".zip", "", "Data Pack Export"))
else fn = string(get_save_filename_ext("Data Pack Folder", dat_name, "", "Data Pack Export"))
if (fn = "") return 0

window = -1
calculate_locked_layers()

with (new(obj_dummy2)) {
	// Initialize variables
	var name = string_path(o.dat_name)
	var namespace = string_path(o.dat_namespace)
	var path = dat_getpath(o.dat_path)
	var objective = "nbs_" + string_copy(string_lettersdigits(o.dat_name), 1, 10)
	var tag = objective
	var playspeed = min(o.tempo * 4, 120)
	var rootfunction = "0_" + string(power(2, floor(log2(o.enda))+1)-1)
	var tempdir
	var functionpath
	var functiondir
	var inputString
	
	if namespace = "" {
		path = ""
		namespace = name
		functionpath = namespace+":"
	} else if path = "" {
		path = name
		functionpath = namespace+":"+path+"/"
	} else {
		path += "/" + name
		functionpath = namespace+":"+path+"/"
	}
	
	// Create folder structure
	tempdir = data_directory + "TempDatapack\\"
	functiondir = dat_makefolders(path, namespace)
	
	//pack.mcmeta
	inputString = "{\n\t\"pack\": {\n\t\t\"pack_format\": 1,\n\t\t\"description\": \"" + o.dat_name + "\\nMade with Minecraft Note Block Studio\"\n\t}\n}"
	dat_writefile(inputString, tempdir + "pack.mcmeta")
	
	//Minecraft folder:
	
	//load.json
	inputString = "{\"values\": [\"" + functionpath + "load\"]}"
	dat_writefile(inputString, tempdir + "data\\minecraft\\tags\\functions\\load.json")
	
	//tick.json
	inputString = "{\"values\": [\"" + functionpath + "tick\"]}"
	dat_writefile(inputString, tempdir + "data\\minecraft\\tags\\functions\\tick.json")
	
	//Song folder:
	
	//load.mcfunction
	inputString = "scoreboard objectives add " + objective + " dummy" + br
	inputString += "scoreboard objectives add " + objective + "_t dummy" + br
	inputString += "scoreboard players set speed " + objective + " " + string(playspeed)
	dat_writefile(inputString, functiondir + "load.mcfunction")
	
	//tick.mcfunction
	inputString = "execute as @a[tag=" + tag + "] run scoreboard players operation @s " + objective + " += speed " + objective + br
	if(o.dat_enableradius) inputString += "execute as @a[tag=" + tag + "] run function " + functionpath + "tree/" + rootfunction
	else inputString += "execute as @a[tag=" + tag + "] at @s run function " + functionpath + "tree/" + rootfunction
	dat_writefile(inputString, functiondir + "tick.mcfunction")
	
	//play.mcfunction
	inputString = "tag @s add " + tag + br
	inputString += "scoreboard players set @s " + objective + "_t -1" + br
	inputString += "team add 1" + br
	inputString += "team add 2" + br
	inputString += "team add 3" + br
	inputString += "team add 4" + br
	inputString += "team add 5" + br
	inputString += "team add 6" + br
	inputString += "team add 7" + br
	inputString += "team add 8" + br
	inputString += "team add 9" + br
	inputString += "team add 10" + br
	inputString += "team add 11" + br
	inputString += "team add 12" + br
	inputString += "team add 13" + br
	inputString += "team add 14" + br
	inputString += "team add 15" + br
	inputString += "team add 16" + br
	inputString += "team add 17" + br
	inputString += "team modify 1 color dark_gray" + br
	inputString += "team modify 2 color red" + br
	inputString += "team modify 3 color black" + br
	inputString += "team modify 4 color yellow" + br
	inputString += "team modify 5 color light_purple" + br
	inputString += "team modify 6 color green" + br
	inputString += "team modify 7 color dark_red" + br
	inputString += "team modify 8 color dark_aqua" + br
	inputString += "team modify 9 color dark_green" + br
	inputString += "team modify 10 color blue" + br
	inputString += "team modify 11 color aqua" + br
	inputString += "team modify 12 color dark_blue" + br
	inputString += "team modify 13 color dark_gray" + br
	inputString += "team modify 14 color dark_green" + br
	inputString += "team modify 15 color gray" + br
	inputString += "team modify 16 color gold" + br
	inputString += "team modify 17 color white"
	dat_writefile(inputString, functiondir + "play.mcfunction")
	
	//pause.mcfunction
	inputString = "tag @s remove " + tag
	dat_writefile(inputString, functiondir + "pause.mcfunction")
	
	//stop.mcfunction
	inputString = "tag @s remove " + tag + br
	inputString += "scoreboard players reset @s " + objective + br
	inputString += "scoreboard players reset @s " + objective + "_t" + br 
	inputString += "team remove 1" + br
	inputString += "team remove 2" + br
	inputString += "team remove 3" + br
	inputString += "team remove 4" + br
	inputString += "team remove 5" + br
	inputString += "team remove 6" + br
	inputString += "team remove 7" + br
	inputString += "team remove 8" + br
	inputString += "team remove 9" + br
	inputString += "team remove 10" + br
	inputString += "team remove 11" + br
	inputString += "team remove 12" + br
	inputString += "team remove 13" + br
	inputString += "team remove 14" + br
	inputString += "team remove 15" + br
	inputString += "team remove 16" + br
	inputString += "team remove 17"
	dat_writefile(inputString, functiondir + "stop.mcfunction")
	
	//Generate binary tree and notes
	dat_generate(functionpath, functiondir, objective)
	
	// Execute shell command to create ZIP, or to move temp folder to location
	if (o.dat_usezip) {
		ExecuteShell("7za a -tzip \"" + fn + "\" \"" + data_directory + "TempDatapack\\*\"", true, true)
	} else {
		ExecuteShell("\"" + data_directory + "move.bat\" \"" + fn + "\\\"", true, true)
	}
	
	directory_destroy(tempdir)
	instance_destroy()
}
message("Data pack saved!" + br + br + "To play the song in-game, use:" + br + br + "/function " + functionpath + "play" + br + "/function " + functionpath + "pause" + br + "/function " + functionpath + "stop","Data Pack Export")
window = w_datapack_export