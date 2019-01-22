// draw_window_stats()
var x1, y1, a, n;
x1 = floor(window_width / 2 - 150)
y1 = floor(window_height / 2 - 175)
draw_window(x1, y1, x1 + 300, y1 + 350)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "About")
draw_sprite(spr_logo, 0, x1 + 86, y1 + 40)
draw_set_halign(fa_center)
draw_text(x1 + 150, y1 + 200, "Open Minecraft Note Block Studio")
draw_set_font(fnt_main) 
draw_text(x1 + 150, y1 + 212, "Version " + version + " - Released " + version_date + "\n\nThis program is a property of David Norgren, \nwith the exception of the audio files.\n\nThis product is not affiliated with\nMojang AB, Microsoft or the game Minecraft.")
draw_set_halign(fa_left)
if (draw_button2(x1 + 120, y1 + 320, 72, "OK", false)) window = 0
