// File
filename = ""
changed = 0
midifile = ""
midiname = ""
song_midi = ""
timesignature = 4

// Playback
tempo = 10
marker_pos = 0
marker_prevpos = 0
section_exists = 0
section_start = 0
section_end = 0
	
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
block_pitched = 0

colamount[0] = 0
rowamount[0] = 0
colfirst[0] = -1
collast[0] = -1

totalblocks = 0

// History
historypos = 0
historylen = 0
for (a = 0; a < 16; a += 1) history[0, 15] = 0

// Selecting
selected = 0
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

// Layers
layername[0] = ""
layerlock[0] = 0
layervol[0] = 100
layerstereo[0] = 100
solostr = ""

// Interface
loop_session = 0
loop = 0
loopmax = 0
loopstart = 0

// Song properties
song_name = ""
song_title = ""
song_author = ""
song_orauthor = ""
song_desc = ""
work_mins = 0
work_left = 0
work_right = 0
work_add = 0
work_remove = 0

song_nbs_version = 0

// Instruments
instrument_list = ds_list_create()

ds_list_add(instrument_list, new_instrument("Harp",          "harp.ogg",     false, true))
ds_list_add(instrument_list, new_instrument("Double Bass",   "dbass.ogg",    false, true))
ds_list_add(instrument_list, new_instrument("Bass Drum",     "bdrum.ogg",    false))
ds_list_add(instrument_list, new_instrument("Snare Drum",    "sdrum.ogg",    false))
ds_list_add(instrument_list, new_instrument("Click",         "click.ogg",    false))
ds_list_add(instrument_list, new_instrument("Guitar",        "guitar.ogg",   false, true))
ds_list_add(instrument_list, new_instrument("Flute",         "flute.ogg",    false, true))
ds_list_add(instrument_list, new_instrument("Bell",          "bell.ogg",     false, true))
ds_list_add(instrument_list, new_instrument("Chime",         "icechime.ogg", false, true))
ds_list_add(instrument_list, new_instrument("Xylophone",     "xylobone.ogg", false, true))
ds_list_add(instrument_list, new_instrument("Iron Xylophone","iron_xylophone.ogg", false, true))
ds_list_add(instrument_list, new_instrument("Cow Bell",      "cow_bell.ogg", false, true))
ds_list_add(instrument_list, new_instrument("Didgeridoo",    "didgeridoo.ogg", false, true))
ds_list_add(instrument_list, new_instrument("Bit",           "bit.ogg", false, true))
ds_list_add(instrument_list, new_instrument("Banjo",         "banjo.ogg", false, true))
ds_list_add(instrument_list, new_instrument("Pling",         "pling.ogg", false, true))

instrument = instrument_list[| 0]
insbox_start = 0
user_instruments = 0

// Initialize instruments
var str = ""
for (var i = 0; i < ds_list_size(instrument_list); i++)
	with (instrument_list[| i]) if (!instrument_load())
	    str += filename + "\n"
if (str != "") message("The following file(s) could not be found:\n\n" + str + "\n\nSome sounds might not play.", "Error")

log("Instruments loaded")