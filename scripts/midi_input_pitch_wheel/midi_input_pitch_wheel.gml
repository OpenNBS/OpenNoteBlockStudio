//  midi_input_pitch_wheel(device)
//      device      Number of the device

//  Returns the pitch wheel offset (-1 to 1) of a connected MIDI input device. 0 is no change.

//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

return (external_call(lib_midi_input_pitch_wheel, argument0) - 64) / 64; // Turn 0->127 to -1->1
