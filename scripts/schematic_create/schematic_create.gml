function schematic_create() {
	// schematic_create()

	// Creates a new schematic for writing/reading.
	// Returns the ID to be used in the other functions.

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	return instance_create_layer(0, 0, 1, obj_schematic);


}
