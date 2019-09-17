// reset()
var a, b;
for (a = 0; a <= endb2; a += 1) {
    layername[a] = ""
    layerlock[a] = 0
    layervol[a] = 100
	layerstereo[a] = 100
}
for (a = 0; a <= enda; a += 1) {
    colamount[a] = 0
    colfirst[a] = -1
    collast[a] = -1
    for (b = 0; b <= endb; b += 1) {
        rowamount[b] = 0
        song_exists[a, b] = 0
        song_ins[a, b] = 0
        song_key[a, b] = 0
        song_vel[a, b] = 0
        song_pan[a, b] = 0
        song_played[a, b] = 0
        song_added[a, b] = 0
    }
}

// File
filename = ""
changed = 0
midifile = ""
autosave = 0
autosavemins = 10
tonextsave = 0

// Playback
playing = 0
tempo = 10
tempodrag = 10
marker_pos = 0
marker_prevpos = 0
fade = 0

// Note blocks
starta = 0
startb = 0
enda = 0
endb = 0
endb2 = 0
compatible = 1
block_outside = 0
block_custom = 0

colamount[0] = 0
rowamount[0] = 0
colfirst[0] = -1
collast[0] = -1
totalblocks = 0

// Selecting
select = 0
selection_delete(0)
section_exists = 0
section_start = 0
section_end = 0
timeline_pressa = -1

// Layers
editline = 0
solostr = ""
dragvolb = 0
realstereo = 0

// Piano
selected_key = 39
key_edit = -1

// Interface
window = 0
selected_tab = 0
global.popup = 0
delay = 0
mouse_xprev = mouse_x
mouse_yprev = mouse_y
sb_val[0] = 0
sb_val[1] = 0
sb_val[2] = 0
sb_val[3] = 0
sb_sel = 0
for (a = 0; a < 200; a += 1) text_exists[a] = 0

// History
historypos = 0
for (a = 0; a <= historylen; a += 1) {
    for (b = 0; b < 9; b += 1) history[a, b] = 0
}
historylen = 0

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

// Clear old instruments
with (obj_instrument) {
    if (user) {
        instrument_free()
        ds_list_delete_value(other.instrument_list, id)
        instance_destroy()
    }
}
user_instruments = 0
instrument = instrument_list[| 0]
