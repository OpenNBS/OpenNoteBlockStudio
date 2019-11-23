//dat_pitch(int key)
//Returns playsound pitch from key

var key, pitch

key = argument0

if (key < 33) key -= 9
else if (key > 57) key -= 57
else key -= 33

pitch = 0.5*(power(2,(key/12)))

return string_format(pitch, 1, 6)