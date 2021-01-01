function schematic_destroy(argument0) {
	// schematic_destroy(id)
	//  id      Schematic to destroy

	// Use this when you are done with a schematic.

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var sch;
	sch = argument0;

	with (sch) instance_destroy();


}
