//  midi_input_key_presses(device)
//      device      Number of the device

//  Returns the amount of key presses from a connected MIDI input since this function was last called.
//  Use the other midi_input_key_press_* functions to get info about the key presses.

//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

return external_call(lib_midi_input_key_presses, argument0);
