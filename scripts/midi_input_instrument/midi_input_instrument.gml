function midi_input_instrument(argument0) {
	//  midi_input_instrument(device)
	//      device      Number of the device

	//  Returns the selected instrument of a connected MIDI input.
	//  Instrument list:
	//      http://en.wikipedia.org/wiki/General_MIDI#Program_change_events

	//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

	return external_call(lib_midi_input_instrument, argument0);



}
