if (!mouse_rectangle(x1, y1, w, h)) {global.popup = 0 instance_destroy()}
if (alarm[0] > -1) exit
if (alpha < 1) alpha += 0.25 * (30 / (room_speed * obj_controller.currspeed)) * (1 + (obj_controller.theme != 3))
draw_popup(x, y, str, singleline, alpha)