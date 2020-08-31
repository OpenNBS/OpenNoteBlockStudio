function midi_input_key_release_time(argument0, argument1) {
	//  midi_input_key_release_time(device, key)
	//      device      Number of the device
	//      key         Number of the key release

	//  Returns the timestamp of a key release from a connected MIDI input device.
	//  The timestamp is the amount of milliseconds between the game starting to read input
	//  from the device (AKA since the game started or the device was plugged in) and the key release.

	//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

	return external_call(lib_midi_input_key_release_time, argument0, argument1);



}
