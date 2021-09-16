function popup_set_window(argument0, argument1, argument2, argument3, argument4) {
	// popup_set_window(x, y, w, h, str)
	var sel, i;
	sel = mouse_rectangle(argument0, argument1, argument2, argument3)
	if (sel && !instance_exists(obj_menu)) {
	    if (global.popup = 0) {
	        global.popup = 1
	        i = create(obj_popup)
	        i.window = window
	        i.str = argument4
	        i.x1 = argument0
	        i.y1 = argument1
	        i.w = argument2
	        i.h = argument3
	        i.singleline = (string_count("\n", i.str) = 0)
	    }
	}
	return sel



}
