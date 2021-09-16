/*
* Provided as a replacement to blur_scripts.gml, which belongs to
* the Realtime Blur extension by Foxy Of Jungle:
* https://marketplace.yoyogames.com/assets/9540/blur-realtime-performance
* 
* Since it's a paid extension, the source code cannot be published
* to the repository, so the extension files must be added manually
* to the project folder after cloning.
* 
* Note Block Studio will work just fine without the extension, but
* the transparency effects for the Fluent theme will be missing the
* blur effect.
*/

function sprite_create_blur_alt(sprite, downamount, width, height, blurradius, quality, directions) {
	// Returns a sprite index
	try {
		return sprite_create_blur(sprite, downamount, width, height, blurradius, quality, directions);
	} catch (exc) {
		return sprite;
	}
}

function draw_surface_blur_alt(surface, x, y, w, h, downamount) {
	try {
		draw_surface_blur(surface, x, y, w, h, downamount);
	} catch (exc) {
		return;
	}
}

// NB: sprite_blur_clear and sprite_draw_blur were suppressed
// from this script as they aren't currently used.
