// control_create()

globalvar buffer, window_width, window_height, window_background;
var a, b, c, w, h, str, str2;

// Initialize logging
log_init()

// Initialize DLLs
lib_init()

// Window
window_width = 0
window_height = 0
window_maximize()
window_set_focus()
window_set_min_width(100)
window_set_min_height(100)
cam_window = camera_create()
view_set_camera(0, cam_window)
window_background = c_white
window2 = 0

// Application
update = 0
check_update = 1
show_welcome = 1
scroll_wheel = 0
theme = 0
clickinarea = 0
dontplace = 0
vers = version
soundsystem = 0
menu_shown = ""
songfolder = songs_directory
icons_init()
refreshrate = 0 //0 = 30fps, 1 = 60fps
fade = 0
rhval = 270

// File
filename = ""
changed = 0
midifile = ""
autosave = 0
autosavemins = 10
tonextsave = 0
for (a = 0; a < 11; a += 1) {
    mididevice_instrument[a] = -1
    recent_song[a] = ""
    recent_song_time[a] = 0
}
timesignature = 4

// Playback
audio_listener_orientation(0,1,0, 0,0,1)
audio_listener_position(100,0,1)
playing = 0
record = 0
tempo = 10
tempodrag = 10
metronome = 0
metronome_played = -1
marker_pos = 0
marker_prevpos = 0
marker_follow = 1
marker_pagebypage = 1
marker_start = 1
marker_end = 0
marker_return = 1
forward = 0
section_exists = 0
section_start = 0
section_end = 0
timeline_pressa = -1
for (a = 0; a < 200; a += 1) text_exists[a] = 0

// Note blocks
starta = 0
startb = 0
enda = 0
endb = 0
arraylength = 0
arrayheight = 0
endb2 = 0
compatible = 0
song_exists[0, 0] = 0
song_ins[0, 0] = 0
song_key[0, 0] = 0
song_vel[0, 0] = 0
song_pan[0, 0] = 0
song_pit[0, 0] = 0
song_played[0, 0] = 0
song_added[0, 0] = 0
block_outside = 0
block_custom = 0
midi_devices = 0

colamount[0] = 0
rowamount[0] = 0
colfirst[0] = -1
collast[0] = -1

show_numbers = 1
show_octaves = 0
draw_type = 0
totalblocks = 0

mousewheel = 0
changepitch = 1

// History
historypos = 0
historylen = 0
for (a = 0; a < 9; a += 1) history[0, 8] = 0

// Selecting
select = 0
drag = 0
drag_pressx = -1
drag_pressy = -1
select_pressx = -1
select_pressy = -1
select_pressa = -1
select_pressb = -1

selected = 0
selection_copied = ""
selection_code = ""
selection_x = 0
selection_y = 0
selection_l = 0
selection_h = 0
selection_exists[0, 0] = 0
selection_ins[0, 0] = 0
selection_key[0, 0] = 0
selection_vel[0, 0] = 0
selection_pan[0, 0] = 0
selection_pit[0, 0] = 0
selection_played[0, 0] = 0
selection_arraylength = 0
selection_arrayheight = 0
selection_colfirst[0] = -1
selection_collast[0] = -1

dragincxr = 0
dragincxl = 0
dragincyd = 0
dragincyu = 0

// Layers
realvolume = 1
realstereo = 0
layername[0] = ""
layerlock[0] = 0
layervol[0] = 100
layerstereo[0] = 100
solostr = ""
dragvolb = 0
dragvol = 0
dragstereob = 0
dragstereo = 0

// Piano
show_piano = 1
show_keynames = 1
show_keyboard = 1
show_notechart = 0
editline = 0
piano_key[87] = 0
key_press[87] = 0
key_midipress[87] = 0
key_click[87] = 0
key_played[87] = 0
key_edit = -1
init_keys()
selected_key = 39
startkey = 0
sharpkeys = 0
keysshow = 0
keysmax = 30
select_lastpressed = 1
record = 0
record_round = 0
warning_octaves = 0
warning_instrument = 0
warning_schematic = 0

// Interface
window = 0
selected_tab = 0
global.popup = 0
globalvar text_focus;
globalvar text_select, text_exists, text_str, text_start, text_line, text_line_wrap, text_line_single, text_lines;
globalvar text_sline, text_spos, text_eline, text_epos, text_cline, text_cpos, text_mline, text_mpos;
globalvar text_click, text_marker, text_key_delay, text_lastwidth, text_laststr, text_lastfocus, text_mouseover, text_chars;
text_select = -1
text_exists[300] = 0
text_click = current_time
text_marker = 0
text_key_delay[7] = 0
text_lastfocus = -1
text_mouseover = -1
text_focus = -1

globalvar sb_count, sb_drag, sb_mprev, sb, sb_press, sb_sel;
sb_count = 0
sb_drag = -1;
sb_mprev = 0;
sb_sel = 0
scrollbarh = create_scrollbar(0)
scrollbarv = create_scrollbar(1)
statscrollbarv = create_scrollbar(1)
insscrollbar = create_scrollbar(1)
midi_sb1 = create_scrollbar(1)
midi_sb2 = create_scrollbar(1)
midi_sb3 = create_scrollbar(1)
midi_sb4 = create_scrollbar(1)
sch_exp_scrollbar = create_scrollbar(1)
update_scrollbar = create_scrollbar(1)
delay = 0
insedit = -1
insselect = -1
mouse_xprev = mouse_x
mouse_yprev = mouse_y
asso_nbs = 1
asso_midi = 0
asso_sch = 0
w_asso_start = 1
wmenu = 0
loop = 0

// Midi export / import
w_midi_remember = 1
w_midi_removesilent = 1
w_midi_name = 1
w_midi_name_patch = 1
w_midi_tab = 0
w_midi_maxheight = 2
w_midi_tempo = 1
w_midi_octave = 1
w_midi_vel = 0
w_isdragging = 0
w_dragvalue = 0
init_midi()

// Song properties
song_name = ""
song_author = ""
song_orauthor = ""
song_desc = ""
work_mins = 0
work_left = 0
work_right = 0
work_add = 0
work_remove = 0

// Instruments
instrument_list = ds_list_create()

ds_list_add(instrument_list, new_instrument("Harp",          "harp.ogg",     false, true))
ds_list_add(instrument_list, new_instrument("Double Bass",   "dbass.ogg",    false))
ds_list_add(instrument_list, new_instrument("Bass Drum",     "bdrum.ogg",    false))
ds_list_add(instrument_list, new_instrument("Snare Drum",    "sdrum.ogg",    false))
ds_list_add(instrument_list, new_instrument("Click",         "click.ogg",    false))
ds_list_add(instrument_list, new_instrument("Guitar",        "guitar.ogg",   false))
ds_list_add(instrument_list, new_instrument("Flute",         "flute.ogg",    false))
ds_list_add(instrument_list, new_instrument("Bell",          "bell.ogg",     false))
ds_list_add(instrument_list, new_instrument("Chime",         "icechime.ogg", false))
ds_list_add(instrument_list, new_instrument("Xylophone",     "xylobone.ogg", false))
ds_list_add(instrument_list, new_instrument("Iron Xylophone","iron_xylophone.ogg", false))
ds_list_add(instrument_list, new_instrument("Cow Bell",      "cow_bell.ogg", false))
ds_list_add(instrument_list, new_instrument("Didgeridoo",    "didgeridoo.ogg", false))
ds_list_add(instrument_list, new_instrument("Bit",           "bit.ogg", false))
ds_list_add(instrument_list, new_instrument("Banjo",         "banjo.ogg", false))
ds_list_add(instrument_list, new_instrument("Pling",         "pling.ogg", false))

instrument = instrument_list[| 0]
first_custom_index = ds_list_size(instrument_list)
user_instruments = 0
emitters_to_remove = ds_list_create()

// Initialize instruments
str = ""
with (obj_instrument)
    if (!instrument_load())
        str += filename + "\n"
if (str != "") message("The following file(s) could not be found:\n\n" + str + "\n\nSome sounds might not play.", "Error")

log("Instruments loaded")

// Minecraft
selected_tab_mc = 0

// Schematic
reset_schematic_export(0)

//Datapack
dat_name = ""
dat_namespace = ""
dat_path = ""
dat_source = "record"
dat_usezip = 1
dat_includelocked = 0
dat_includeoutofrange = 0
dat_enableradius = 0
dat_radius = 16
dat_radiusvalue = 0
dat_enablelooping = 0
dat_loopstart = 0

//MP3
mp3_includelocked = 0

// Settings
load_settings()
change_theme()
if (show_welcome) window = w_greeting
if (check_update)
    update_http = http_get("https://api.github.com/repos/HielkeMinecraft/OpenNoteBlockStudio/releases/latest")
else
    update_http = -1
if (file_exists_lib(data_directory + "settings.onbs") && vers != version) {
    window = w_update
    update = 3
}
log("Startup OK")

// Clipboard Editor
clipboard = ""