function selection_extend_length(new_length = undefined){
	if (is_undefined(new_length)) {
		new_length = enda
	}
	if (new_length > selection_arraylength) { // New length
	    for (a = new_length; a >= selection_arraylength + 1; --a) {
	        selection_colfirst[@ a] = -1
	        selection_collast[@ a] = -1
	        for (b = selection_arrayheight; b >= 0; --b) {
	            selection_exists[@ a, b] = 0
	        }
	    }
	    selection_arraylength = new_length
	}
}