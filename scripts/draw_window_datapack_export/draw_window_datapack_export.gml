// draw_window_datapack_export()
var x1, y1
curs = cr_default
x1 = floor(window_width / 2 - 275)
y1 = floor(window_height / 2 - 200)
draw_window(x1, y1, x1 + 550, y1 + 400)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Datapack Export")
draw_set_font(fnt_main) 

draw_sprite(spr_datapack_exp, sch_exp_layout, x1 + 15, y1 + 30)

//Name
draw_text(x1 + 16, y1 + 200, "Unique name:")
dat_name = draw_inputbox(1,x1 + 16, y1+ 220,120,dat_name,"Used to differentiate created datapack from others")

//Source
draw_text(x1 + 16, y1 + 260, "Sound source")
if (draw_radiobox(x1 + 28, y1 + 285, dat_source = "ambient", "ambient", "Use ambient source")) dat_source = "ambient"
if (draw_radiobox(x1 + 28, y1 + 305, dat_source = "block", "block", "Use block source")) dat_source = "block"
if (draw_radiobox(x1 + 28, y1 + 325, dat_source = "hostile", "hostile", "Use hostile source")) dat_source = "hostile"
if (draw_radiobox(x1 + 28, y1 + 345, dat_source = "master", "master", "Use master source")) dat_source = "master"
if (draw_radiobox(x1 + 28, y1 + 365, dat_source = "music", "music", "Use music source")) dat_source = "music"
if (draw_radiobox(x1 + 100, y1 + 285, dat_source = "neutral", "neutral", "Use neutral source")) dat_source = "neutral"
if (draw_radiobox(x1 + 100, y1 + 305, dat_source = "player", "player", "Use player source")) dat_source = "player"
if (draw_radiobox(x1 + 100, y1 + 325, dat_source = "record", "record", "Use record source")) dat_source = "record"
if (draw_radiobox(x1 + 100, y1 + 345, dat_source = "voice", "voice", "Use voice source")) dat_source = "voice"
if (draw_radiobox(x1 + 100, y1 + 365, dat_source = "weather", "weather", "Use weather source")) dat_source = "weather"

//Locked layers
if (draw_checkbox(x1 + 212, y1 + 225, dat_includelocked, "Include locked layers", "Whether to include locked layers in the Datapack.")) dat_includelocked=!dat_includelocked

//Out of range notes
if (draw_checkbox(x1 + 212, y1 + 250, dat_includeoutofrange, "Include out of range notes", "Whether to include notes that don't fall into the 2-octave range supported by"+br+"Minecraft. This will require an additional resource pack included with the program.")) dat_includeoutofrange = !dat_includeoutofrange

//Radius
if (draw_checkbox(x1 + 212, y1 + 275, dat_enableradius, "Nearby players hear music too", "Whether to let all players in a given radius"+br+"hear the music as well")) dat_enableradius = !dat_enableradius
if(dat_enableradius) { 
	dat_radius = median(16, draw_dragvalue(3, x1 + 322, y1 + 295, dat_radius, 2),100000) 
	dat_radiusvalue = 1 + (dat_radius - 16) * 0.06
}
else draw_set_color(c_gray) draw_text(x1 + 322, y1 + 295, dat_radius)
draw_text(x1 + 212, y1 + 295, "Radius (in blocks):")
popup_set_window(x1 + 212, y1 + 292, 125, 21, "The radius of which players will hear the music")
draw_theme_color()

//Looping
if (draw_checkbox(x1 + 212, y1 + 325, dat_enablelooping, "Enable looping", "If enabled, the song will loop at the"+br+"end of playback instead of stopping.")) dat_enablelooping = !dat_enablelooping
if(dat_enablelooping) { 
	dat_loopstart = median(0, draw_dragvalue(3, x1 + 322, y1 + 345, dat_loopstart, 2), obj_controller.enda)
}
else draw_set_color(c_gray) draw_text(x1 + 322, y1 + 345, dat_loopstart)
draw_text(x1 + 212, y1 + 345, "Loop start:")
popup_set_window(x1 + 212, y1 + 341, 125, 21, "Tick the song will jump to at the end of playback")
draw_theme_color()

//Submit button
if (draw_button2(x1 + 470, y1 + 368, 72, "Export", false)) {
	if(string_replace_all(dat_name," ", "") != "" ){
		datapack_export()
	}else{
		message("Please enter a valid name for the datapack","Error")
	}
}

if (draw_button2(x1 + 390, y1 + 368, 72, "Cancel", false)) {
	window = 0
}