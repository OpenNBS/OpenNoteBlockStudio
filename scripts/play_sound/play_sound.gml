/// @description  play_sound(instrument, key, volume, pan)
/// @function  play_sound
/// @param instrument
/// @param  key
/// @param  volume

var ins, key, vol, pan;
ins = argument0
key = argument1
vol = argument2
pan = argument3

if (!ins.loaded)
    return 0
emitter=audio_emitter_create()
audio_emitter_pitch(emitter, 0.495 * power(1.06, (key + ins.key - 78)))
audio_emitter_gain(emitter, vol)
audio_emitter_position(emitter,pan,0,0)
audio_play_sound_on(emitter,ins.sound, 0, 0)