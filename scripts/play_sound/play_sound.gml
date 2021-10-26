/// @description  play_sound(instrument, key, volume, pan)
/// @function  play_sound
/// @param instrument
/// @param  key
/// @param  volume
/// @param  pan
/// @param  fine pitch
function play_sound(argument0, argument1, argument2, argument3, argument4) {

	var ins, key, vol, pan, newemitter, emitter, pit
	ins = argument0
	key = argument1
	vol = argument2
	pan = argument3
	pit = argument4

	if (!ins.loaded)
	    return 0
	emitter=audio_emitter_create()
	audio_emitter_pitch(emitter, 0.495 * power(1.06, (key + (ins.key + (pit/100) - 78))))
	audio_emitter_gain(emitter, (vol / 100) * mastervol)
	if (realstereo = 0) audio_emitter_position(emitter,pan,0,0)
	else audio_emitter_position(emitter,100,0,0)

	audio_play_sound_on(emitter,ins.sound, 0, 0)
	sounds++

	//Schedule emitter to be deleted from memory
	newemitter = ds_list_create()
	ds_list_add(newemitter,emitter) //store emitter id
	var length = audio_sound_length(ins.sound) / (3 * (os_type = os_windows) + 1) * (1/audio_emitter_get_pitch(emitter))
	ds_list_add(newemitter, (get_timer() + length * 1000000)) //store moment at which the emitter should be removed
	ds_list_add(emitters_to_remove, newemitter)


}
