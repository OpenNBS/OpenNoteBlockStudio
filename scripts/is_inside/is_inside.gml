function is_inside(argument0, argument1, argument2, argument3, argument4, argument5) {
	// is_inside(x, y, x1, y1, x2, y2)
	var xx, yy, x1, y1, x2, y2;
	xx = argument0
	yy = argument1
	x1 = min(argument2, argument4)
	y1 = min(argument3, argument5)
	x2 = max(argument2, argument4)
	y2 = max(argument3, argument5)
	return (xx >= x1 && xx <= x2 && yy >= y1 && yy <= y2)



}
