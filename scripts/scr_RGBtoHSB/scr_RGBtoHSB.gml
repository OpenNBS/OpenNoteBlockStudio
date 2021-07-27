/// @param Red
/// @param Green
/// @param Blue
function scr_RGBtoHSB(argument0, argument1, argument2) {

	var components = array_create(3, 0);

	var R = ( argument0 / 255 );                    
	var G = ( argument1 / 255 );
	var B = ( argument2 / 255 );

	var tempMin = min( R, G, B );	//Min. value of RGB
	var tempMax = max( R, G, B );	//Max. value of RGB
	var delMax = tempMax - tempMin;	//Delta RGB value 

	// Set the value to max
	var tempB = tempMax;

	// If delMax is 0 then there is no chroma
	if ( delMax == 0 ) {
	   var tempH = 0;        // Set the Hue to 0                                
	   var tempS = 0;        // Set the Sat to 0
	} else {
	   tempS = delMax / tempMax;

	   delR = ( ( ( tempMax - R ) / 6 ) + ( delMax / 2 ) ) / delMax;
	   delG = ( ( ( tempMax - G ) / 6 ) + ( delMax / 2 ) ) / delMax;
	   delB = ( ( ( tempMax - B ) / 6 ) + ( delMax / 2 ) ) / delMax;

	   if ( R == tempMax ) tempH = delB - delG;
	   else if ( G == tempMax ) tempH = ( 1 / 3 ) + delR - delB;
	   else if ( B == tempMax ) tempH = ( 2 / 3 ) + delG - delR;

	   if ( tempH < 0 ) tempH += 1;
	   if ( tempH > 1 ) tempH -= 1;
	}

	// Create the HSV array
	components[0] = floor(tempH * 360);
	components[1] = floor(tempS * 100);
	components[2] = floor(tempB * 100);

	// Return the HSV array
	return components;



}
