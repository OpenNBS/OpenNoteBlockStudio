//  midi_input_control(device, control)
//      device      Number of the device
//      control     Control number

//  Returns the 0 - 127 value of the given control of a connected MIDI input device. For advanced users.
//  For list of MIDI controls (varies from device to device):
//      http://www.midi.org/techspecs/midimessages.php#3

//  By David "Davve" Norgren for MIDI input - www.stuffbydavid.com

return external_call(lib_midi_input_control, argument0, argument1);
