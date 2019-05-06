// set_theme_color(bool inverted)
var inverted = argument0

if(inverted){
	if(obj_controller.theme = 2)draw_set_color(0)
	else draw_set_color(c_white)
}else{
	if(obj_controller.theme = 2)draw_set_color(c_white)
	else draw_set_color(0)
}