function get_keyname(argument0, argument1) {
	// get_keyname(n, showoctave)
	// LIMITS:
	// 0 = lowest
	// 33 = mc lowest
	// 57 = mc highest
	// 87 = highest

	var n, show;
	n = argument0
	show = argument1

	return keynames[n mod 12] + condstr(show, string(floor((n - 3) / 12) + 1))

}
