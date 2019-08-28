// datapack_export()
var fn, o
o = obj_controller

if (o.dat_usezip) fn = string(get_save_filename_ext("ZIP archive (*.zip)|*.zip", dat_name + ".zip", "", "Datapack Export"))
else fn = string(get_save_filename_ext("Datapack Folder", dat_name, "", "Datapack Export"))
if (fn = "") return 0

window = -1

with (new(obj_dummy2)) {
	// Initialize variables
	var name = string_path(o.dat_name)
	var namespace = string_path(o.dat_namespace)
	var path = dat_getpath(o.dat_path)
	var randomId = string(randomize())
	var objective = "song" + randomId
	var playspeed = min(o.tempo * 4, 80)
	var rootfunction = "1_" + string(power(2, floor(log2(o.enda)) + 1))
	var tempdir
	var functionpath
	var functiondir
	var inputString
	var zipfile = ""
	if (o.dat_usezip) zipfile = zip_create()
	
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
	
	// Create folder structure if not using ZIP
	if (o.dat_usezip) {
		tempdir = ""
		functiondir = "data/" + namespace + "/functions/" + path + condstr(path != "", "/")
	} else {
		tempdir = data_directory + "TempDatapack\\"
		functiondir = dat_makefolders(path, namespace)
	}
	
	//pack.mcmeta
	inputString = "{\n\t\"pack\": {\n\t\t\"pack_format\": 1,\n\t\t\"description\": \"Note block song made with Minecraft Note Block Studio\"\n\t}\n}"
	dat_writefile(inputString, tempdir + "pack.mcmeta", zipfile)
	
	//Minecraft folder:
	
	//load.json
	inputString = "{\n\t\"values\": [\n\t\t\"" + functionpath + "load\"\n\t]\n}"
	dat_writefile(inputString, tempdir + "data\\minecraft\\tags\\functions\\load.json", zipfile)
	
	//tick.json
	inputString = "{\n\t\"values\": [\n\t\t\"" + functionpath + "tick\"\n\t]\n}"
	dat_writefile(inputString, tempdir + "data\\minecraft\\tags\\functions\\tick.json", zipfile)
	
	//Song folder:
	
	//load.mcfunction
	inputString = "scoreboard objectives add " + objective + " dummy" + br
	inputString += "scoreboard objectives add " + objective + "_t dummy" + br
	inputString += "scoreboard players set speed " + objective + " " + string(playspeed)
	dat_writefile(inputString, functiondir + "load.mcfunction", zipfile)
	
	//tick.mcfunction
	inputString = "execute as @a[tag=play" + randomId + "] run scoreboard players operation @s " + objective + " += speed " + objective + br
	if(o.dat_enableradius) inputString += "execute as @a[tag=play" + randomId + "] run function " + name + ":tree/" + rootfunction
	else inputString += "execute as @a[tag=play" + randomId + "] at @s run function " + name + ":tree/" + rootfunction
	dat_writefile(inputString, functiondir + "tick.mcfunction", zipfile)
	
	//play.mcfunction
	inputString = "tag @s add play" + randomId + br
	inputString += "scoreboard players set @s " + objective + "_t 0"
	dat_writefile(inputString, functiondir + "play.mcfunction", zipfile)
	
	//pause.mcfunction
	inputString = "tag @s remove play" + randomId
	dat_writefile(inputString, functiondir + "pause.mcfunction", zipfile)
	
	//stop.mcfunction
	inputString = "tag @s remove play" + randomId + br
	inputString += "scoreboard players reset @s " + objective + br
	inputString += "scoreboard players reset @s " + objective + "_t" + br 
	dat_writefile(inputString, functiondir + "stop.mcfunction", zipfile)
	
	//Generate binary tree and notes
	dat_generate(functionpath, functiondir, objective, zipfile)
	
	// Save ZIP, or execute shell command to move temp folder to location
	if (zipfile != "") {
		show_debug_message(data_directory)
		zip_save(zipfile, fn)
		zip_destroy(zipfile)
	} else {
		ExecuteShell("\"" + data_directory + "move.bat\" \"" + fn + "\\\"", true, true);
		directory_delete_lib(tempdir)
	}
	
	instance_destroy()
}
message("Datapack saved!","Datapack Export")
window = w_datapack_export