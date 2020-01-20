/// @description  play_sound(instrument, key, volume, pan)
/// @function  play_sound
/// @param instrument
/// @param  key
/// @param  volume
/// @param  pan
/// @param  fine pitch

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
audio_emitter_gain(emitter, vol / 100)
if (realstereo = 0) audio_emitter_position(emitter,pan,0,0)
else audio_emitter_position(emitter,100,0,0)

audio_play_sound_on(emitter,ins.sound, 0, 0)

//Schedule emitter to be deleted from memory
newemitter = ds_list_create()
ds_list_add(newemitter,emitter) //store emitter id
ds_list_add(newemitter, (audio_sound_length(ins.sound) * 1000000 * (1/audio_emitter_get_pitch(emitter))) + get_timer()) //store moment at which the emitter should be removed
ds_list_add(emitters_to_remove, newemitter)