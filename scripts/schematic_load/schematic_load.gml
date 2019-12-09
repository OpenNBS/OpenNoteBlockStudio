// schematic_load(id, filename)
//  id          Schematic to put data in
//  filename    Direct or relative path to .schematic file

// Loads data from the given file and stores it into a schematic.
// Entity or TileEntity data is not supported.
// All existing data in the schematic will be overwritten. Returns whether successful.

// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

var sch, filen;
sch = argument0;
filen = argument1;

sch.xsize = 0;
sch.ysize = 0;
sch.zsize = 0;
sch.blockpos = -1;
sch.datapos = -1;

var file, fileblock, filedata, a, b, c, t;

// Check if start compound name is valid
external_call(global.dll_ReadByte, file);
if (nbt_string_read(file) != "Schematic") {
    external_call(global.dll_CloseFile, file);
    file_delete("temp");
    return false;
}

// Read binary tags
nbt_tags_read(sch, file);
external_call(global.dll_CloseFile, file);

// Check if size is invalid
if (sch.xsize = 0 || sch.ysize = 0 || sch.zsize = 0) {
    sch.xsize = 0;
    sch.ysize = 0;
    sch.zsize = 0;
    file_delete("temp");
    return false;
}

// Check if no block or data array was found
if (sch.blockpos = -1 || sch.datapos = -1) {
    file_delete("temp");
    return false;
}

// Read blocks and their additional data
fileblock = external_call(global.dll_OpenFileRead, "temp");
filedata = external_call(global.dll_OpenFileRead, "temp");
external_call(global.dll_SetPosition, fileblock, sch.blockpos);
external_call(global.dll_SetPosition, filedata, sch.datapos);

sch.dsize = sqrt(sch.xsize * sch.ysize * sch.zsize);
sch.xysize = max(sch.xsize, sch.ysize) + 1;
for (c = 0; c < sch.zsize; c += 1) {
    for (a = 0; a < sch.xsize; a += 1) {
        for (b = sch.ysize - 1; b >= 0; b -= 1) {
            t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
            sch.block[t div sch.dsize, t mod sch.dsize] = external_call(global.dll_ReadUByte, fileblock);
            sch.data[t div sch.dsize, t mod sch.dsize] = external_call(global.dll_ReadUByte, filedata);
        }
    }
}

// Clean up
external_call(global.dll_CloseFile, fileblock);
external_call(global.dll_CloseFile, filedata);
file_delete("temp");

return true;