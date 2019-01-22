// popup_set(x, y, w, h, str)
var sel, i;
if (window > 0 && window < w_menu) return 0
sel = mouse_rectangle(argument0, argument1, argument2, argument3)
if (sel) {
    if (global.popup = 0) {
        global.popup = 1
        i = new(obj_popup)
        i.window = 0
        i.str = argument4
        i.x1 = argument0
        i.y1 = argument1
        i.w = argument2
        i.h = argument3
        i.singleline = (string_count("\n", i.str) = 0)
    }
}
return sel
