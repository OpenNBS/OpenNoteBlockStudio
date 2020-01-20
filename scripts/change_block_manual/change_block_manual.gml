// change_block_manual(x, y, ins, key, vel, pan, pit)
var xx, yy, ins, key, vel, pan, pit, pins, pkey, pvel, ppan, ppit;
xx = argument0
yy = argument1
ins = argument2
key = argument3
vel = argument4
pan = argument5
pit = argument6
pins = song_ins[xx, yy]
pkey = song_key[xx, yy]
pvel = song_vel[xx, yy]
ppan = song_pan[xx, yy]
ppit = song_pit[xx, yy]
song_ins[xx, yy] = ins
song_key[xx, yy] = key
song_vel[xx, yy] = vel
song_pan[xx, yy] = pan
song_pit[xx, yy] = pit

if (ins.loaded) play_sound(ins, key, vel, pan, pit)

history_set(h_changeblock, xx, yy, ins, key, vel, pan, pit, pins, pkey, pvel, ppan, ppit)
changed = 1
if (pkey >= 33 && pkey <= 57 && (key < 33 || key > 57)) block_outside += 1
if (key >= 33 && key <= 57 && (pkey < 33 || pkey > 57)) block_outside -= 1
if (ppit = 0 && pit != 0) block_pitched += 1
if (ppit != 0 && pit = 0) block_pitched -= 1
