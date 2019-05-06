// draw_window_properties()
var x1, y1, a; 
curs = cr_default
text_exists[0] = 0
x1 = floor(window_width / 2 - 220)
y1 = floor(window_height / 2 - 215)
draw_window(x1, y1, x1 + 440, y1 + 430)
draw_set_font(fnt_mainbold)
draw_text(x1 + 8, y1 + 8, "Song Properties")
draw_set_font(fnt_main)
if (theme = 0) {
    draw_set_color(c_white)
    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 392, 0)
    draw_set_color(make_color_rgb(137, 140, 149))
    draw_rectangle(x1 + 6, y1 + 26, x1 + 434, y1 + 392, 1)
}
draw_areaheader(x1 + 22, y1 + 48, 396, 200, "Information")

draw_text(x1 + 32, y1 + 67, "Song name:")
a = song_name
song_name = draw_inputbox(1, x1 + 158, y1 + 64, 240, song_name, "The name of the song.")
if (song_name = "") {
    draw_set_color(c_gray)
    draw_text(x1 + 161, y1 + 68, "Untitled song")
    draw_theme_color()
}
if (a != song_name) changed = 1

draw_text(x1 + 32, y1 + 67 + 23, "Song author:")
a = song_author
song_author = draw_inputbox(2, x1 + 158, y1 + 64 + 23, 240, song_author, "The name of the creator of the song.")
if (a != song_author) changed = 1

draw_text(x1 + 32, y1 + 67 + 23 * 2, "Original song author:")
a = song_orauthor
song_orauthor = draw_inputbox(3, x1 + 158, y1 + 64 + 23 * 2, 240, song_orauthor, "The name of the creator of the original song\n(Leave empty if you composed the song yourself.)")
if (a != song_orauthor) changed = 1

draw_text(x1 + 32, y1 + 67 + 23 * 3, "Description:")
a = song_desc
song_desc = draw_textarea(4, x1 + 158, y1 + 64 + 23 * 3, 240, 100, song_desc, "Enter a description for your song.")
if (a != song_desc) changed = 1

draw_areaheader(x1 + 22, y1 + 270, 396, 70, "Auto-saving")
a = autosave
if (draw_checkbox(x1 + 40, y1 + 290, autosave, "Enable auto-saving", "Whether the song should automatically\nbe saved every now and then.")) autosave=!autosave
if (a != autosave) {
    changed = 1
    if (autosave = 0) tonextsave = 0
    if (autosave = 1) tonextsave = autosavemins
}
draw_theme_color()
if (autosave = 0) {
    draw_set_color(c_white)
    draw_text(x1 + 71, y1 + 311, "Minutes between savings:")
    draw_set_color(8421504)
}
draw_text(x1 + 70, y1 + 310, "Minutes between savings:")
a = autosavemins
autosavemins = median(1, draw_dragvalue(2, x1 + 220, y1 + 310, autosavemins, 1, !autosave), 60)
if (autosavemins != a) {changed = 1 tonextsave = autosavemins}
popup_set_window(x1 + 70, y1 + 310, 180, 16, "The amount of minutes between each auto-save.")

draw_theme_color()
draw_text(x1 + 32, y1 + 358, "Time signature:")
timesignature = median(2, draw_dragvalue(3, x1 + 120, y1 + 358, timesignature, 1), 8)
draw_text(x1 + 120 + string_width(string(timesignature)), y1 + 358, " / 4")
popup_set_window(x1 + 32, y1 + 356, 110, 18, "The time signature of the song.")
if (draw_button2(x1 + 320, y1 + 398, 72, "OK")) {window = 0}
window_set_cursor(curs)
