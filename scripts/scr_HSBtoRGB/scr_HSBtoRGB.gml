/// @param Hue
/// @param Saturation
/// @param Brightness
function scr_HSBtoRGB(argument0, argument1, argument2) {

	var components = array_create(3, 0);

	// Set components to Percentages
	var H = (argument0 / 360);
	var S = (argument1 / 100);
	var B = (argument2 / 100);

	if (S == 0) {
		components[0] = floor(B * 255);
		components[1] = floor(B * 255);
		components[2] = floor(B * 255);
	} else {
		var tempH = (H * 6);
		if (tempH == 6) tempH = 0;
		var i = floor(tempH);
		var temp1 = B * (1 - S);
		var temp2 = B * (1 - S * (tempH - i));
		var temp3 = B * (1 - S * (1 - (tempH - i)));
	
		if (i == 0) {
			components[0] = floor(B * 255);
			components[1] = floor(temp3 * 255);
			components[2] = floor(temp1 * 255);
		} else if (i == 1) {
			components[0] = floor(temp2 * 255);
			components[1] = floor(B * 255);
			components[2] = floor(temp1 * 255);
		} else if (i == 2) {
			components[0] = floor(temp1 * 255);
			components[1] = floor(B * 255);
			components[2] = floor(temp3 * 255);	
		} else if (i == 3) {
			components[0] = floor(temp1 * 255);
			components[1] = floor(temp2 * 255);
			components[2] = floor(B * 255);
		} else if (i == 4) {
			components[0] = floor(temp3 * 255);
			components[1] = floor(temp1 * 255);
			components[2] = floor(B * 255);	
		} else {
			components[0] = floor(B * 255);
			components[1] = floor(temp1 * 255);
			components[2] = floor(temp2 * 255);
		}
	}

	return components;


}
