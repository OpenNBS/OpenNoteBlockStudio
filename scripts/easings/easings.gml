function ease_in_sine(x) {
	return 1 - cos((x * pi) / 2);
}

function ease_out_sine(x) {
	return sin((x * pi) / 2);
}