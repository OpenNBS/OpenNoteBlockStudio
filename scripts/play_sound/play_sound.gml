/// @description  play_sound(instrument, key, volume, pan)
/// @function  play_sound
/// @param instrument
/// @param  key
/// @param  volume

var ins, key, vol, pan, newemitter, emitter
ins = argument0
key = argument1
vol = argument2
pan = argument3

if (!ins.loaded)
    return 0
emitter=audio_emitter_create()
audio_emitter_pitch(emitter, 0.495 * power(1.06, (key + ins.key - 78)))
audio_emitter_gain(emitter, vol)
if (realstereo = 0) audio_emitter_position(emitter,pan,0,0)
else audio_emitter_position(emitter,100,0,0)

audio_play_sound_on(emitter,ins.sound, 0, 0)

//Schedule emitter to be deleted from memory
newemitter = ds_list_create()
ds_list_add(newemitter,emitter) //store emitter id
ds_list_add(newemitter, (audio_sound_length(ins.sound) * 600000) + get_timer()) //store moment of which the emitter should be removed
ds_list_add(emitters_to_remove, newemitter)