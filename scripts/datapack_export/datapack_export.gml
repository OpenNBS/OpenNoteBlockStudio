// datapack_export()
var fn, o
fn = string(get_save_filename_ext("Datapack Folder", dat_name, "", "Datapack Export"))
if (fn = "") return 0

var tempdir = data_directory + "TempDatapack\\"
if(directory_exists(tempdir))directory_delete_lib(tempdir)
directory_create_lib(tempdir)

window = -1
o = obj_controller

with (new(obj_dummy2)) {
	// Initialize variables
	var name = string_path(o.dat_name)
	var namespace = string_path(o.dat_namespace)
	var path = dat_getpath(o.dat_path)
	var randomId = string(randomize())
	var objective = "song" + randomId
	var playspeed = max(o.tempo * 4, 80)
	var rootFunction = "1_" + string(power(2, floor(log2(o.enda)) + 1))
	var file
	var inputString
	
	// Create folder structure
	var functionpath
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
	
	var folders = []
	var foldercount = 0
	var str = ""
	if path != "" {
		for (i = 1; i <= string_length(path); i++) {			
			var char = string_char_at(path, i)
			if (char = "/") {
				folders[foldercount] = str
				foldercount++
				str = ""
			} else {
				str += char
				folders[foldercount] = str
			}
		}
	}
	var functiondir = tempdir + "data\\" + namespace + "\\functions\\"
	
	directory_create_lib(tempdir + "data\\")
	directory_create_lib(tempdir + "data\\minecraft\\")
	directory_create_lib(tempdir + "data\\minecraft\\tags\\")
	directory_create_lib(tempdir + "data\\minecraft\\tags\\functions\\")
	directory_create_lib(tempdir + "data\\"+ namespace +"\\")
	directory_create_lib(functiondir)
	
	// Dinamically create function folder
	if (array_length_1d(folders) > 0) {
		for (i = 0; i <= foldercount; i++) {
			functiondir += folders[i] + "\\"
			directory_create_lib(functiondir)
		}
	}
	directory_create_lib(functiondir + "notes")
	directory_create_lib(functiondir + "tree")
	
	//pack.mcmeta
	inputString = "{ \"pack\": { \"description\": \"Note block song made with Minecraft Note Block Studio\", \"pack_format\": 1 } }"
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,tempdir+"pack.mcmeta")
    buffer_delete(file)
	
	//Minecraft folder:
	
	//load.json
	inputString = "{ \"values\": [ \""+functionpath+"load\" ] }"
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,tempdir+"data\\minecraft\\tags\\functions\\load.json")
    buffer_delete(file)
	
	//tick.json
	inputString = "{ \"values\": [ \""+functionpath+"tick\" ] }"
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,tempdir+"data\\minecraft\\tags\\functions\\tick.json")
    buffer_delete(file)
	
	//Song folder:
	
	//load.mcfunction
	inputString = "scoreboard objectives add " + objective + " dummy" + br
	inputString += "scoreboard objectives add " + objective + "_t dummy" + br
	inputString += "scoreboard players set speed " + objective + " " + string(playspeed)
    file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,functiondir + "load.mcfunction")
    buffer_delete(file)
	
	//tick.mcfunction
	inputString = "execute as @a[tag=play" + randomId + "] run scoreboard players operation @s " + objective + " += speed " + objective + br
	if(o.dat_enableradius) inputString += "execute as @a[tag=play" + randomId + "] run function " + name + ":tree/" + rootFunction
	else inputString += "execute as @a[tag=play" + randomId + "] at @s run function " + name + ":tree/" + rootFunction
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,functiondir + "tick.mcfunction")
    buffer_delete(file)
	
	//play.mcfunction
	inputString = "tag @s add play" + randomId + br
	inputString += "scoreboard players set @s " + objective + "_t 0"
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,functiondir + "play.mcfunction")
    buffer_delete(file)
	
	//pause.mcfunction
	inputString = "tag @s remove play" + randomId
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,functiondir + "pause.mcfunction")
    buffer_delete(file)
	
	//stop.mcfunction
	inputString = "tag @s remove play" + randomId + br
	inputString += "scoreboard players reset @s " + objective + br
	inputString += "scoreboard players reset @s " + objective + "_t" + br 
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,functiondir + "stop.mcfunction")
    buffer_delete(file)
	
	//Generate binary tree and notes
	dat_generate(functionpath, functiondir, objective)
	
	// Execute shell command that moves temp pack to location
	ExecuteShell("\"" + data_directory + "move.bat\" \"" + fn + "\\\"", true, true);
	instance_destroy()
}
message("Datapack saved!","Datapack Export")
window = w_datapack_export