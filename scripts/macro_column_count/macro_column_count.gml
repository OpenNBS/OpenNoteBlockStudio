function macro_column_count(arr_data, length = undefined){
	if (is_undefined(length)) {
		length = array_length(arr_data)
	}
	
	var count = 0
	for (var i = 0; i < length; ++i) {
		if (arr_data[i] == -1) {
			++count
		}
	}
	return count
}