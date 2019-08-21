// draw_window_minecraft()
var x1, y1, a, n, yy;
x1 = floor(window_width / 2 - 200)
y1 = floor(window_height / 2 - 175)
draw_window(x1, y1, x1 + 400, y1 + 350)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Minecraft Compatibility")
draw_set_font(fnt_main)
draw_text(x1 + 16, y1 + 32, "Due to the limitations of note blocks, the song must meet certain\ncriteria in order to be properly imported into Minecraft.")

yy = y1 + 80

//Fully compatible
if(tempo = 10 || tempo = 5 || tempo = 2.5){
	draw_sprite(spr_yesno, 1, x1 + 20, yy + 8)
	//only datapack
}else if(tempo <= 20){
	draw_sprite(spr_yesno, 2, x1 + 20, yy + 8)
}else{
	//not compatible
	draw_sprite(spr_yesno, 0, x1 + 20, yy + 8)
}

draw_set_font(fnt_mainbold)
draw_text(x1 + 40, yy, "The tempo must be either 2.5, 5 or 10 ticks per second. \n")
draw_set_font(fnt_main)
draw_text(x1 + 40, yy+15, "Any tempo under 20 ticks per second also works when\nexporting as datapack.")

if (tempo = 10 || tempo = 5 || tempo = 2.5) {    
	draw_set_color(c_green)
    draw_text(x1 + 40, yy + 45, "The tempo is " + string(tempo) + " ticks per second.")
} else if(tempo <= 20){
    draw_set_color(c_orange)
    draw_text(x1 + 40, yy + 45, "The tempo is datapack compatible")
	    if (draw_button2(x1 + 40, yy + 65, 145, "Fix tempo for schematic")) {
        var otempo;
        otempo = tempo
        if (otempo > 10) tempo = 10
        if (otempo < 10) tempo = 10
        if (otempo < 7.5) tempo = 5
        if (otempo < 3.75) tempo = 2.5
    }
}else{
	draw_set_color(c_red)
    draw_text(x1 + 40, yy + 45, "The tempo is " + string(tempo) + " ticks per second.")
    if (draw_button2(x1 + 40, yy + 65, 140, "Fix tempo for datapack")) {
        var otempo;
        otempo = tempo
		if (otempo > 20) tempo = 20
    }
}
draw_theme_color()

yy += 100
draw_sprite(spr_yesno, block_outside = 0, x1 + 20, yy + 8)
draw_set_font(fnt_mainbold)
draw_text(x1 + 40, yy, "All blocks must be within Minecraft's 2 octave range.")
draw_set_font(fnt_main)
if (block_outside > 0) {    
    draw_set_color(c_red)
    if (block_outside = 1) {
        draw_text(x1 + 40, yy + 16, "There is 1 block outside the 2 octave range.")
    } else {
        draw_text(x1 + 40, yy + 16, "There are " + string(block_outside) + " blocks outside the 2 octave range.")
    }
    if (draw_button2(x1 + 40, yy + 34, 130, "Select affected blocks")) {
        select_outside()
        window = 0
    }
    if (draw_button2(x1 + 180, yy + 34, 100, "Transpose notes")) {
        if (question("Transpose notes so that they fall within Minecraft's 2 octaves?", "Transpose notes")) {
            select_all(-1, 0)
            selection_transpose()
            selection_place(0)
        }
    }
} else {
    draw_set_color(c_green)
    draw_text(x1 + 40, yy + 16, "There are no blocks outside the 2 octave range.")
}
draw_theme_color()

yy += 70
draw_sprite(spr_yesno, block_custom = 0, x1 + 20, yy + 8)
draw_set_font(fnt_mainbold)
draw_text(x1 + 40, yy, "No custom instruments must be used.")
draw_set_font(fnt_main)
if (block_custom > 0) {    
    draw_set_color(c_red)
    draw_text(x1 + 40, yy + 16, "There are " + string(block_custom) + " block" + condstr(block_custom > 1, "s") + " with custom instruments.")
    if (draw_button2(x1 + 40, yy + 34, 160, "Select affected blocks")) {
        select_custom()
        window = 0
    }
} else {
    draw_set_color(c_green)
    draw_text(x1 + 40, yy + 16, "There are no blocks with custom instruments.")
}
draw_theme_color()

if (draw_button2(x1 + 139 + 25, y1 + 310, 72, "OK")) window = 0
window_set_cursor(cr_default)
