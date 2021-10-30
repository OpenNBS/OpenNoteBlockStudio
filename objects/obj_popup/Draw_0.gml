if (!mouse_rectangle(x1, y1, w, h)) {global.popup = 0 instance_destroy()}
if (alarm[0] > -1) exit
draw_popup(x, y, str, singleline)