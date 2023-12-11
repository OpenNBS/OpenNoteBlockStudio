function remove_emitters() {
	
	if (os_type != os_macosx) {
	
	//Called from control_draw every frame
	//Removes emitters from memory to prevent memory leaking
	var pos, arr, emitterid, timetoremove

	for(pos = 0; pos < ds_list_size(emitters_to_remove); pos++){
		arr = ds_list_find_value(emitters_to_remove,pos)
	
		emitterid = ds_list_find_value(arr,0)
		timetoremove = ds_list_find_value(arr,1)
	
		if(get_timer() >= timetoremove){
			ds_list_delete(emitters_to_remove,pos)
			audio_emitter_free(emitterid)
			//log("freeing emitter with id " + string(emitterid))
			sounds--
		}
	}

	} else {
	
	//Called from control_draw every frame
	//Removes emitters from memory to prevent memory leaking
	var pos, arr, emitterid, timetoremove

	for(pos = 0; pos < ds_list_size(emitters_to_remove); pos++){
		arr = ds_list_find_value(emitters_to_remove,pos)
	
		emitterid = ds_list_find_value(arr,0)
		timetoremove = ds_list_find_value(arr,1)
	
		if(get_timer() >= timetoremove){
			ds_list_delete(emitters_to_remove,pos)
			//audio_emitter_free(emitterid)
			audio_stop_sound(emitterid)
			//log("freeing emitter with id " + string(emitterid))
			sounds--
		}
	}
	
	}

}

function remove_emitters_all() {
	var pos, arr, emitterid, timetoremove

	for(pos = 0; pos < ds_list_size(emitters_to_remove); pos++){
		arr = ds_list_find_value(emitters_to_remove,pos)
	
		emitterid = ds_list_find_value(arr,0)
		timetoremove = ds_list_find_value(arr,1)
	
		if(true){
			ds_list_delete(emitters_to_remove,pos)
			//audio_emitter_free(emitterid)
			audio_stop_sound(emitterid)
			//log("freeing emitter with id " + string(emitterid))
			sounds--
		}
	}
}