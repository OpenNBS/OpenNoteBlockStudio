/// @description  play_sound(instrument, key, volume)
/// @function  play_sound
/// @param instrument
/// @param  key
/// @param  volume

var ins, key, vol, index;
ins = argument0
key = argument1
vol = argument2

if (!ins.loaded)
    return 0

index = audio_play_sound(ins.sound, 0, 0)
audio_sound_pitch(index, 0.5 * power(1.06, (key + ins.key - 78)))
audio_sound_gain(index, vol, 0)
