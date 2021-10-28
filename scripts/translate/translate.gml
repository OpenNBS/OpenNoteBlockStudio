function translate(key){
	var str = variable_struct_get(lang, key);
	if is_undefined(str) {
		str = key
	};
	for (i = 1; i < argument_count; i++) {
		str = string_replace(str, "%" + string(i) + "$s", string(argument[i]))
	}
}