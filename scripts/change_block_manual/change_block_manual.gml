// change_block_manual(x, y, ins, key)
var xx, yy, ins, key, pins, pkey;
xx = argument0
yy = argument1
ins = argument2
key = argument3

pins = song_ins[xx, yy]
pkey = song_key[xx, yy]
song_ins[xx, yy] = ins
song_key[xx, yy] = key

if (ins.loaded) play_sound(ins, key, 1,100)

history_set(h_changeblock, xx, yy, ins, key, pins, pkey)
changed = 1
if (pkey >= 33 && pkey <= 57 && (key < 33 || key > 57)) block_outside += 1
if (key >= 33 && key <= 57 && (pkey < 33 || pkey > 57)) block_outside -= 1
