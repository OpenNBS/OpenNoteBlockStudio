function midi_input_sound_controller(argument0, argument1) {
	//  midi_input_sound_controller(device, controller)
	//      device      Number of the device
	//      controller  Sound controller number
	//                  Defaults:
	//                      0 = Sound Variation
	//                      1 = Timbre/Harmonic Intensity
	//                      2 = Release Time
	//                      3 = Attack Time
	//                      4 = Brightness
	//                      5 = Decay Time
	//                      6 = Vibrato Rate
	//                      7 = Vibrato Depth
	//                      8 = Vibrato Delay

	//  Returns the value (0 - 127) of the chosen sound control of a connected MIDI input device.
	//  The sound controls vary from device to device.

	//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

	return midi_input_control(argument0, 70 + argument1);



}
