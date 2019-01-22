// get_keyname(n, showoctave)
// LIMITS:
// 0 = lowest
// 33 = mc lowest
// 57 = mc highest
// 87 = highest


var n, show, str;
n = argument0
show = argument1
str[0] = "A"
str[1] = "A#"
str[2] = "B"
str[3] = "C"
str[4] = "C#"
str[5] = "D"
str[6] = "D#"
str[7] = "E"
str[8] = "F"
str[9] = "F#"
str[10] = "G"
str[11] = "G#"
return str[n mod 12] + condstr(show, string(floor((n - 3) / 12) + 1))
