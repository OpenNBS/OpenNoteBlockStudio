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

//Namespace
draw_text(x1 + 16, y1 + 250, "Namespace:")
dat_namespace = draw_inputbox(2,x1 + 16, y1+ 270,120,dat_namespace,"(optional) Use this to place the functions under a custom namespace."+br+"If empty, namespace will be the name of the song.")

//Path
draw_text(x1 + 16, y1 + 300, "Path:")
dat_path = draw_inputbox(3,x1 + 16, y1+ 320,120,dat_path,"(optional) Path to the song from the main 'functions'"+br+"folder. You can use / to add subfolders.")

//Preview
draw_text(x1 + 16, y1 + 350, "Command preview:")
if (string_replace_all(dat_name, " ", "") = "") {
	draw_text(x1 + 16, y1 + 370, "<enter name>")
} else {
	if (string_replace_all(dat_namespace, " ", "") = "") {
		draw_text(x1 + 16, y1 + 370, "/function "+string_lower(string_replace_all(dat_name+":play", " ", "_")))
	} else {
		if (string_replace_all(dat_path, " ", "") = "") {
			draw_text(x1 + 16, y1 + 370, "/function "+string_lower(string_replace_all(dat_namespace+":"+dat_name+"/play", " ", "_")))
		} else {
			draw_text(x1 + 16, y1 + 370, "/function "+string_lower(string_replace_all(dat_namespace+":"+dat_path+"/"+dat_name+"/play", " ", "_")))
		}
	}
}

//Source

draw_text(x1 + 162, y1 + 200, "Sound source")
if (draw_radiobox(x1 + 167, y1 + 220, dat_source = "ambient", "ambient", "Use ambient source")) dat_source = "ambient"
if (draw_radiobox(x1 + 167, y1 + 240, dat_source = "block", "block", "Use block source")) dat_source = "block"
if (draw_radiobox(x1 + 167, y1 + 260, dat_source = "hostile", "hostile", "Use hostile source")) dat_source = "hostile"
if (draw_radiobox(x1 + 167, y1 + 280, dat_source = "master", "master", "Use master source")) dat_source = "master"
if (draw_radiobox(x1 + 167, y1 + 300, dat_source = "music", "music", "Use music source")) dat_source = "music"
if (draw_radiobox(x1 + 239, y1 + 220, dat_source = "neutral", "neutral", "Use neutral source")) dat_source = "neutral"
if (draw_radiobox(x1 + 239, y1 + 240, dat_source = "player", "player", "Use player source")) dat_source = "player"
if (draw_radiobox(x1 + 239, y1 + 260, dat_source = "record", "record", "Use record source")) dat_source = "record"
if (draw_radiobox(x1 + 239, y1 + 280, dat_source = "voice", "voice", "Use voice source")) dat_source = "voice"
if (draw_radiobox(x1 + 239, y1 + 300, dat_source = "weather", "weather", "Use weather source")) dat_source = "weather"

//Locked layers
if (draw_checkbox(x1 + 340, y1 + 205, dat_includelocked, "Include locked layers", "Whether to include locked layers in the Datapack.")) dat_includelocked=!dat_includelocked

//Out of range notes
if (draw_checkbox(x1 + 340, y1 + 230, dat_includeoutofrange, "Include out of range notes", "Whether to include notes that don't fall into the 2-octave range supported by"+br+"Minecraft. This will require an additional resource pack included with the program.")) dat_includeoutofrange = !dat_includeoutofrange

//Radius
if (draw_checkbox(x1 + 340, y1 + 255, dat_enableradius, "Nearby players hear music too", "Whether to let all players in a given radius"+br+"hear the music as well")) dat_enableradius = !dat_enableradius
if(dat_enableradius) { 
	dat_radius = median(16, draw_dragvalue(3, x1 + 450, y1 + 275, dat_radius, 2),100000) 
	dat_radiusvalue = 1 + (dat_radius - 16) * 0.06
}
else draw_set_color(c_gray) draw_text(x1 + 450, y1 + 275, dat_radius)
draw_text(x1 + 340, y1 + 275, "Radius (in blocks):")
popup_set_window(x1 + 340, y1 + 271, 125, 21, "The radius of which players will hear the music")
draw_theme_color()

//Looping
if (draw_checkbox(x1 + 340, y1 + 305, dat_enablelooping, "Enable looping", "If enabled, the song will loop at the"+br+"end of playback instead of stopping.")) dat_enablelooping = !dat_enablelooping
if(dat_enablelooping) { 
	dat_loopstart = median(0, draw_dragvalue(3, x1 + 450, y1 + 325, dat_loopstart, 2), obj_controller.enda)
}
else draw_set_color(c_gray) draw_text(x1 + 450, y1 + 325, dat_loopstart)
draw_text(x1 + 340, y1 + 325, "Loop start:")
popup_set_window(x1 + 340, y1 + 321, 125, 21, "Tick the song will jump to at the end of playback")
draw_theme_color()

//Submit button
if (draw_button2(x1 + 470, y1 + 368, 72, "Export", false)) {
	if(string_replace_all(dat_name," ", "") != "") {
		if(string_count("/", dat_path) >= 10) {
			message("Path can only contain up to 5 subfolders", "Error")
		} else {
		datapack_export()
		}
	}else{
		message("Please enter a valid name for the datapack","Error")
	}
}

if (draw_button2(x1 + 390, y1 + 368, 72, "Cancel", false)) {
	window = 0
}