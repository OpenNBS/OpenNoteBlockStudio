// schematic_save(id, filename)
//  id          Schematic to save
//  filename    Direct or relative path to new .schematic file

// Saves the given schematic into a .schematic file.
// Will overwrite the file if it exists.
// Schematic file format:
//      http://minecraft.gamepedia.com/Schematic

// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

var sch, fn, entries, noteblocks;
sch = argument0;
fn = argument1;
entries = argument2
noteblocks = argument3;

var file, a, b, c, t, z;
file = external_call(global.dll_OpenFileWrite, "temp");

// Write NBT tags
nbt_tag_compound(file, "Schematic") {
    nbt_tag_short(file, "Length", sch.xsize);
    nbt_tag_short(file, "Width", sch.ysize);
    nbt_tag_short(file, "Height", sch.zsize);
    nbt_tag_string(file, "Materials", "Alpha");
    nbt_tag_list(file, "Entities", 10, 0);
    nbt_tag_list(file, "TileEntities", 10, noteblocks);
	for (z = 0; z < sch_exp_chords; z ++) {
		for (a = 0; a <= entries; a ++) {
			if nblockkey[z, a] != 0 { 
				nbt_tag_string(file, "id", "minecraft:noteblock")
				nbt_tag_int(file, "x", - noteblockx[z, a] + (sch_exp_range_end - sch_exp_range_start) * 2 + 3) // why the hell does this work
				nbt_tag_int(file, "y", noteblocky[z, a])
				nbt_tag_int(file, "z", noteblockz[z, a])
				nbt_tag_byte(file, "note", noteblocknote[z, a])
				nbt_tag_end(file)
			}
		}
	}
    nbt_tag_byte_array(file, "Blocks", sch.xsize * sch.ysize * sch.zsize) {
        for (c = 0; c < sch.zsize; c += 1) {
            for (a = 0; a < sch.xsize; a += 1) {
                for (b = sch.ysize - 1; b >= 0; b -= 1) {
                    t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
                    external_call(global.dll_WriteByte, file, sch.block[t div sch.dsize, t mod sch.dsize]);
                }
            }
        }
    }
    nbt_tag_byte_array(file, "Data", sch.xsize * sch.ysize * sch.zsize) {
        for (c = 0; c < sch.zsize; c += 1) {
            for (a = 0; a < sch.xsize; a += 1) {
                for (b = sch.ysize - 1; b >= 0; b -= 1) {
                    t = a * sch.xysize * sch.zsize + b + c * sch.xysize;
                    external_call(global.dll_WriteByte, file, sch.data[t div sch.dsize, t mod sch.dsize]);
                }
            }
        }
    }
    nbt_tag_end(file);
}
external_call(global.dll_CloseFile, file);
gzzip("temp", fn)
file_delete("temp");