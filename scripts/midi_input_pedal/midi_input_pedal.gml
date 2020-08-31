function midi_input_pedal(argument0) {
	//  midi_input_pedal(device)
	//      device      Number of the device

	//  Returns whether the pedal of a connected MIDI input device is pressed.

	//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

	return midi_input_control(argument0, 64) >= 64;



}
