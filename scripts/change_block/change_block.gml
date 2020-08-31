function change_block(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	// change_block(x, y, ins, key, vel, pan, pit)
	var xx, yy, ins, key, vel, pan, pit;
	xx = argument0
	yy = argument1
	ins = argument2
	key = argument3
	vel = argument4
	pan = argument5
	pit = argument6

	song_ins[xx, yy] = ins
	song_key[xx, yy] = key
	song_vel[xx, yy] = vel
	song_pan[xx, yy] = pan
	song_pit[xx, yy] = pit


}
