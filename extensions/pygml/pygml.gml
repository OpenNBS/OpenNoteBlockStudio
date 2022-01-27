#define _python_prepare_buffer
/// (size:int)->buffer~
var _size = argument0;
gml_pragma("global", "global.__python_buffer = undefined");
var _buf = global.__python_buffer;
if (_buf == undefined) {
	_buf = buffer_create(_size, buffer_grow, 1);
	global.__python_buffer = _buf;
} else if (buffer_get_size(_buf) < _size) {
	buffer_resize(_buf, _size);
}
buffer_seek(_buf, buffer_seek_start, 0);
return _buf;


#define python_set_buffer_size
/// (size:int)
var _size = argument0;
_python_prepare_buffer(_size);
return;


#define python_call_function
/// @function python_call_function(module, function[, args[, kwargs]])
/// @description Runs a Python function from a module. A single positional
///			argument may be passed directly to the function. You may pass
///			positional arguments as an array, and multiple keyword arguments
///			as a struct.
/// @param {string} module		The Python module to run the function from
/// @param {string} function	The function name to be called
/// @param {struct} args		A single value, or an array containing the positional argument(s) to pass
/// @param {array}  kwargs		A struct containing the keyword argument(s) to pass

var module = argument[0];
var obj = argument[1];
var args = argument[2];
var kwargs = argument[3];

args = !is_undefined(args) ? args : []
kwargs = !is_undefined(kwargs) ? kwargs : {} 

// Serialize arguments to JSON string
var args_str = json_stringify(args);
if (is_struct(kwargs)) {
	var kwargs_str = json_stringify(kwargs);
} else {
	show_message("pygml error: Keyword arguments must be specified in a struct")
	return;
}

// Prepare buffer and write arguments to pass
var _buf = _python_prepare_buffer(4096);
buffer_write(_buf, buffer_string, module);
buffer_write(_buf, buffer_string, obj);
buffer_write(_buf, buffer_string, args_str);
buffer_write(_buf, buffer_string, kwargs_str);

// Run Python module
var ret = _python_call_function(buffer_get_address(_buf));
switch (ret) {
	case -1: // Python exception
		var exc = buffer_read(_buf, buffer_string);
		show_debug_message("Python exception raised: " + exc + "\n");
		throw exc;
	case 0: // Couldn't run function
		show_message("pygml error: The extension couldn't be loaded");
		return;
	case 1: // Success; parse JSON string back into object
		var result = buffer_read(_buf, buffer_string);
		if (result == "null") { // json_parse() doesn't correctly parse a single 'null' value
			return pointer_null;
		} else {
			return json_parse(result);
		}
}
