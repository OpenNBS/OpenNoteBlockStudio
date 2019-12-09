// nbt_tag_byte_array(file, name, len)
//  file        GMBinaryFile file handle
//  name        Name of the tag
//  len         Size of array

// Writes the beginning of a byte array tag to the file.
// Used when saving schematic files, which are in the NBT (Named Binary Tag) format by Notch.

// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

var file, name, len;
file = argument0;
name = argument1;
len = argument2;

external_call(global.dll_WriteByte, file, 7);
nbt_string_write(file, name);
external_call(global.dll_WriteInt, file, len);