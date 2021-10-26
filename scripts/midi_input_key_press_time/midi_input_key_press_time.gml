function midi_input_key_press_time(argument0, argument1) {
	//  midi_input_key_press_time(device, key)
	//      device      Number of the device
	//      key         Number of the key press

	//  Returns the timestamp of a key press from a connected MIDI input device.
	//  The timestamp is the amount of milliseconds between the game starting to read input
	//  from the device (AKA since the game started or the device was plugged in) and the key press.

	//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

	if (os_type = os_windows) return external_call(lib_midi_input_key_press_time, argument0, argument1);



}
