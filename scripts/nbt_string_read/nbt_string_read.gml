function nbt_string_read(argument0) {
	// nbt_string_read(file)
	//  file        GMBinaryFile file handle

	// Reads a string from the file and returns it.
	// Used when loading schematic files, which are in the NBT (Named Binary Tag) format by Notch.

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var file;
	file = argument0;

	var str, len, p;
	str = "";

	len = external_call(global.dll_ReadShort, file);
	repeat (len) str += chr(external_call(global.dll_ReadByte, file));

	return str;


}
