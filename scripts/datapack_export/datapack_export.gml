// datapack_export()
var fn, o,dir
fn = string(get_save_filename_ext("Datapack Folder", dat_name, "", "Datapack Export"))
if (fn = "") return 0

var tempdir = data_directory + "TempDatapack\\"
if(directory_exists(tempdir))directory_delete_lib(tempdir)
directory_create_lib(tempdir)

dat_obj = "song"+string(randomize())
window = -1
o = obj_controller

with (new(obj_dummy2)) {
	// Initialize variables  
	var objective = o.dat_obj
	var name = string_lower(string_replace_all(o.dat_name," ","_"))
	var randomId = string(randomize())
	var playspeed = max(o.tempo * 4, 80)
	var rootFunction = "1_" + string(power(2, floor(log2(o.enda)) + 1))
	var file
	var functiondir = tempdir + "data\\"+name+"\\functions\\"
	var inputString
	
	//Create folder structure
	directory_create_lib(tempdir + "data\\")
	directory_create_lib(tempdir + "data\\minecraft\\")
	directory_create_lib(tempdir + "data\\minecraft\\tags\\")
	directory_create_lib(tempdir + "data\\minecraft\\tags\\functions\\")
	directory_create_lib(tempdir + "data\\"+ name +"\\")
	directory_create_lib(functiondir)
	directory_create_lib(functiondir + "\\notes")
	directory_create_lib(functiondir + "\\tree")
	
	//pack.mcmeta
	inputString = "{ \"pack\": { \"description\": \"Note block song made with Minecraft Note Block Studio\", \"pack_format\": 1 } }"
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,tempdir+"pack.mcmeta")
    buffer_delete(file)
	
	//Minecraft folder:
	
	//load.json
	inputString = "{ \"values\": [ \""+name+":load\" ] }"
	file = buffer_create(string_length(inputString), buffer_fixed, 1)
	buffer_write(file,buffer_text,inputString)
	buffer_export(file,tempdir+"data\\minecraft\\tags\\functions\\load.json")
    buffer_delete(file)
	
	//tick.json
	inputString = "{ \"values\": [ \""+name+":tick\" ] }"
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
	dat_generate(name, functiondir)
	
	// Execute shell command that moves temp pack to location
	ExecuteShell("\"" + data_directory + "move.bat\" \"" + fn + "\\\"", true, true);
	instance_destroy()
}
message("Datapack saved!","Datapack Export")
window = w_datapack_export