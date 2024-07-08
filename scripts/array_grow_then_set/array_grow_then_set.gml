function array_grow_then_set(array, index, value) {
	// Set a value at the index of the array; also allows custom growth of the array
	
	var length = array_length(array)
	if (index >= length) {
		var new_size = index + 1
		var new_length = new_size * 3 / 2; // 1.5x growth factor
		//var new_length = (new_size + (new_size >> 3) + 6) & ~3; // Python-style growth
		//show_debug_message(string(length) + " -> " + string(floor(new_length)))
		for (var i = new_length - 1; i >= length; --i) {
			array[@ i] = 0
		}
	}
	array[@ index] = value
}