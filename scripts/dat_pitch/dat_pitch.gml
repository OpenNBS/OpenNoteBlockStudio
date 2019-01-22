//dat_pitch(int key)
//Returns playsound pitch from key

var key, pitch
key = argument0 - 33
return 0.5*(power(2,(key/12)))