function selection_extend_height(new_height = undefined){
	if (is_undefined(new_height)) {
		new_height = endb
	}
	if (new_height > selection_arrayheight) { // New height
	    for (var a = selection_arraylength; a >= 0; --a) {
	        for (var b = new_height; b >= selection_arrayheight + 1; --b) {
	            selection_exists[@ a, b] = 0
	        }
	    }
	    selection_arrayheight = new_height
	}
}