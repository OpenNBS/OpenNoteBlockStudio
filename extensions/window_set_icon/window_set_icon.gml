#define window_set_icon_init
//#macro window_set_icon_hresult global.g_window_set_icon_hresult
//#macro window_set_icon_context global.g_window_set_icon_context
window_set_icon_hresult = 0;
window_set_icon_context = "";
global.g_window_set_icon_argbuf = -1;
global.g_window_set_icon_path = undefined;
global.g_window_set_icon_buffer = -1;
global.g_window_set_icon_surface_buffer = [-1, -1, -1];
global.g_window_set_overlay_icon_path = undefined;
global.g_window_set_overlay_icon_buffer = -1;
global.s_window_set_icon_dll_missing = "DLL is not loaded";
global.s_window_set_icon_file_exists = "File does not exist";
global.s_window_set_icon_buffer_load = "Failed to load file";
global.s_window_set_icon_all_good = "All good!";
global.s_window_set_icon_reuse = "Already using this icon - no action needed";
var _inf = os_get_info();
window_set_icon_init_raw(ds_map_exists(_inf, "video_d3d11_device"));
ds_map_destroy(_inf);

#define window_set_icon_impl_load
/// (path)~
var _path = argument0;
if (!file_exists(_path)) {
	window_set_icon_hresult = $80004005;
	window_set_icon_context = global.s_window_set_icon_file_exists;
	return -1;
}

var _buf = buffer_load(_path);
if (_buf == -1) {
	window_set_icon_hresult = $80004005;
	window_set_icon_context = global.s_window_set_icon_buffer_load;
	return -1;
}
return _buf;

#define window_set_icon_impl_reuse
/// ()~
window_set_icon_hresult = 0;
window_set_icon_context = global.s_window_set_icon_reuse;
return true;

#define window_set_icon_impl_argbuf
/// ()~
var _arg = global.g_window_set_icon_argbuf;
if (_arg == -1) {
	_arg = buffer_create(128, buffer_fixed, 1);
	global.g_window_set_icon_argbuf = _arg;
}
buffer_seek(_arg, buffer_seek_start, 0);
return _arg;

#define window_set_icon_impl_surfbuf
/// (size, index)~
var _size = argument0, _ind = argument1;
var _buf = global.g_window_set_icon_surface_buffer[_ind];
if (_buf == -1) {
	_buf = buffer_create(_size + 1, buffer_fixed, 1);
	buffer_poke(_buf, _size, buffer_u8, 0);
	global.g_window_set_icon_surface_buffer[_ind] = _buf;
} else if (buffer_get_size(_buf) <= _size) {
	buffer_resize(_buf, _size + 1);
	buffer_poke(_buf, _size, buffer_u8, 0);
}
return _buf;

#define window_set_icon_impl_argres
/// (argbuf, offset)~
var _arg = argument0, _ofs = argument1;
buffer_seek(_arg, buffer_seek_start, _ofs);
window_set_icon_hresult = buffer_read(_arg, buffer_u32);
window_set_icon_context = buffer_read(_arg, buffer_string);

#define window_set_icon
/// (path_to_an_ico)
var _path = argument0;
if (_path == global.g_window_set_icon_path) return window_set_icon_impl_reuse();

var _buf = window_set_icon_impl_load(_path);
if (_buf == -1) return false;
if (global.g_window_set_icon_buffer != -1) buffer_delete(global.g_window_set_icon_buffer);
global.g_window_set_icon_buffer = _buf;

var _result = window_set_icon_buffer(_buf);
global.g_window_set_icon_path = _path;
return _result;

#define window_set_icon_buffer
/// (buffer_with_an_ico_inside)
var _buf = argument0;

var _arg = window_set_icon_impl_argbuf();
buffer_write(_arg, buffer_u32, buffer_get_size(_buf));
buffer_write(_arg, buffer_u32, $80004005);
buffer_write(_arg, buffer_string, global.s_window_set_icon_dll_missing);

var _ok = window_set_icon_raw(window_handle(), buffer_get_address(_buf), buffer_get_address(_arg));
window_set_icon_impl_argres(_arg, 4);
global.g_window_set_icon_path = undefined;
return _ok;

//#define window_set_icon_surface
//// (surface, set_big_icon)
//var _sf = argument0, _big = argument1;
//var _w = surface_get_width(_sf);
//var _h = surface_get_height(_sf);
//_big = _big ? 1 : 0;
//var _buf = window_set_icon_impl_surfbuf(_w * _h * 4, _big);
//buffer_get_surface(_buf, _sf, 0);

var _arg = window_set_icon_impl_argbuf();
buffer_write(_arg, buffer_s32, _w);
buffer_write(_arg, buffer_s32, _h);
buffer_write(_arg, buffer_s32, _big);
buffer_write(_arg, buffer_u32, $80004005);
buffer_write(_arg, buffer_string, global.s_window_set_icon_dll_missing);

var _ok = window_set_icon_surface_raw(window_handle(), buffer_get_address(_buf), buffer_get_address(_arg));
window_set_icon_impl_argres(_arg, 12);
global.g_window_set_icon_path = undefined;
return _ok;

#define window_reset_icon
/// ()
window_reset_icon_raw(window_handle());
global.g_window_set_icon_path = undefined;
window_set_icon_hresult = 0;
window_set_icon_context = global.s_window_set_icon_all_good;
return true;

#define window_set_overlay_icon
/// (path_to_an_ico, ?description)
var _path = argument[0];
var _desc = argument_count > 1 ? argument[1] : "";
//
if (_path == global.g_window_set_overlay_icon_path) return window_set_icon_impl_reuse();
var _buf = window_set_icon_impl_load(_path);
if (_buf == -1) return false;
if (global.g_window_set_overlay_icon_buffer != -1) buffer_delete(global.g_window_set_overlay_icon_buffer);
global.g_window_set_overlay_icon_buffer = _buf;

var _result = window_set_overlay_icon_buffer(_buf, _desc);
global.g_window_set_overlay_icon_path = _path;
return _result;

#define window_set_overlay_icon_buffer
/// (buffer_with_an_ico_inside, ?description)
var _buf = argument[0];
var _desc = argument_count > 1 ? argument[1] : "";

var _arg = window_set_icon_impl_argbuf();
buffer_write(_arg, buffer_u32, buffer_get_size(_buf));
buffer_write(_arg, buffer_u32, $80004005);
buffer_write(_arg, buffer_string, global.s_window_set_icon_dll_missing);

var _ok = window_set_overlay_icon_raw(window_handle(), buffer_get_address(_buf), string(_desc), buffer_get_address(_arg));
window_set_icon_impl_argres(_arg, 4);
global.g_window_set_overlay_icon_path = undefined;
return _ok;

#define window_set_overlay_icon_surface
/// (surface, ?description)
var _sf = argument[0];
var _desc = argument_count > 1 ? argument[1] : "";
var _w = surface_get_width(_sf);
var _h = surface_get_height(_sf);
var _buf = window_set_icon_impl_surfbuf(_w * _h * 4, 2);
buffer_get_surface(_buf, _sf, 0);

var _arg = window_set_icon_impl_argbuf();
buffer_write(_arg, buffer_s32, _w);
buffer_write(_arg, buffer_s32, _h);
buffer_write(_arg, buffer_s32, 0);
buffer_write(_arg, buffer_u32, $80004005);
buffer_write(_arg, buffer_string, global.s_window_set_icon_dll_missing);

var _ok = window_set_overlay_icon_surface_raw(window_handle(), buffer_get_address(_buf), _desc, buffer_get_address(_arg));
window_set_icon_impl_argres(_arg, 12);
global.g_window_set_overlay_icon_path = undefined;
return _ok;

#define window_reset_overlay_icon
/// ()
window_reset_overlay_icon_raw(window_handle());
global.g_window_set_overlay_icon_path = undefined;
window_set_icon_hresult = 0;
window_set_icon_context = global.s_window_set_icon_all_good;
return true;