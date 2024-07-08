function find_asset_indexes() {

	if (!directory_exists(mc_install_path)) {
		show_message("No Minecraft installation was found\nat the selected location!");
		return;
	}
	
	var assets_dir = mc_install_path
	if (string_char_at(assets_dir, string_length(assets_dir)) != "\\") {
		assets_dir = assets_dir + "\\";
	}
	assets_dir = assets_dir + "assets\\";
	
	// Search for .json files in the assets/ folder
	show_debug_message("Looking for index files at " + assets_dir);
	var asset_indexes = [];
	var file_name = file_find_first(assets_dir + "indexes\\*.json", 0);
	while (file_name != "") {
	    array_push(asset_indexes, string_replace(file_name, ".json", ""));
		show_debug_message(file_name);
	    file_name = file_find_next();
	}
	file_find_close();
	
	return asset_indexes;
}


function load_asset_index(index_name, copy = false) {
	
	// Loads an asset index.
	
	// Open and parse asset index
	var asset_index_path = assets_dir + "indexes\\" + "16.json"
	if (!file_exists(asset_index_path)) {
		show_message("The file for the specified asset index could not be found!")
		return;
	}
	var file_buffer = buffer_load(asset_index_path);
	var content = buffer_read(file_buffer, buffer_string);
	buffer_delete(file_buffer);
	
	// Get objects in asset index
	var json = json_parse(content);
	var objects = json[$ "objects"];
	
	var count = 0;
	var keys = variable_struct_get_names(objects);
	
	var sounds_mc_subdir = sounds_directory + "minecraft";
	
	if (directory_exists_lib(sounds_mc_subdir)) {
		if (!message_yesnocancel("An existing folder with imported Minecraft sounds has been found in your Sounds folder. Would you like to replace it?", "Warning")) {
			return;
		} else {
			directory_delete_lib(sounds_mc_subdir);
		}
	}
	
	for (var i = array_length(keys) - 1; i >= 0; --i) {
	    var key = keys[i];
		var value = objects[$ key];
	    
		if (string_count("minecraft/sounds/", key) == 0) {
			continue;
		}
		
		// Skip music and records
		if (string_count("music/", key) > 0 || string_count("records/", key) > 0) {
			continue;
		}
		
		var hash = value[$ "hash"];
		//show_debug_message(key + " " + hash);

		if (copy) {
			var src = assets_dir + "objects\\" + string_copy(hash, 1, 2) + "\\" + hash;
			var dst = sounds_mc_subdir + string_replace(key, "minecraft/sounds/", "");
		
			if (!file_exists_lib(src)) {
				continue;
			}
			if (!directory_exists_lib(filename_dir(dst))) {
				directory_create_lib(filename_dir(dst))
			}
			files_copy_lib(src, dst);
		}
		count++;
		
		//show_debug_message(src);
		//show_debug_message(dst);
	}
	
	return count;
}


