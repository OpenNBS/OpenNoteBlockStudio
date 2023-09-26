function nbt_tags_read(argument0, argument1) {
	// nbt_tags_read(id, file)
	//  id          Schematic to put data in
	//  file        GMBinaryFile file handle

	// Reads tags from the given file handle until the end is reached.
	// Important info is stored in the schematic instance.
	// Used when loading schematic files, which are in the NBT (Named Binary Tag) format by Notch.
	// Schematic file format:
	//      http://minecraft.wiki/w/Schematic

	// By David "Davve" Norgren for GMschematic - www.stuffbydavid.com

	var sch, file;
	sch = argument0;
	file = argument1;

	var tagtype, tagname, val;
	tagtype = external_call(global.dll_ReadByte, file);
	if (tagtype < 1) return 0; // TAG_End

	tagname = nbt_string_read(file);

	switch (tagtype) {
	    case 1: { // TAG_Byte
	        external_call(global.dll_ReadByte, file);
	        break;
	    }
	    case 2: { // TAG_Short
	        val = external_call(global.dll_ReadShort, file);
	        if (tagname = "Length") sch.xsize = val;
	        else if (tagname = "Width") sch.ysize = val;
	        else if (tagname = "Height") sch.zsize = val;
	        break;
	    }
	    case 3: { // TAG_Int
	        // Really old schematics use TAG_Int for the size...
	        val = external_call(global.dll_ReadInt, file);
	        if (tagname = "Length") sch.xsize = val;
	        else if (tagname = "Width") sch.ysize = val;
	        else if (tagname = "Height") sch.zsize = val;
	        break;
	    }
	    case 4: { // TAG_Long
	        external_call(global.dll_ReadDouble, file);
	        break;
	    }
	    case 5: { // TAG_Float
	        external_call(global.dll_ReadFloat, file);
	        break;
	    }
	    case 6: { // TAG_Double
	        external_call(global.dll_ReadDouble, file);
	        break;
	    }
	    case 7: { // TAG_Byte_Array
	        var len, pos;
	        len = external_call(global.dll_ReadInt, file);
	        pos = external_call(global.dll_GetPosition, file)
	        if (tagname = "Blocks") sch.blockpos = pos;
	        else if (tagname = "Data") sch.datapos = pos;
	        external_call(global.dll_SetPosition, file, pos + len);
	        break;
	    }
	    case 8: { // TAG_String
	        nbt_string_read(file);
	        break;
	    }
	    case 9: { // TAG_List
	        var listtype, listlen;
	        listtype = external_call(global.dll_ReadByte, file);
	        listlen = external_call(global.dll_ReadInt, file);
	        repeat (listlen) {
	            switch (listtype) {
	                case 1: external_call(global.dll_ReadByte, file); break;
	                case 2: external_call(global.dll_ReadShort, file); break;
	                case 3: external_call(global.dll_ReadInt, file); break;
	                case 4: external_call(global.dll_ReadDouble, file); break;
	                case 5: external_call(global.dll_ReadFloat, file); break;
	                case 6: external_call(global.dll_ReadDouble, file); break;
	                case 8: nbt_string_read(file); break;
	                case 10: nbt_tags_read(sch, file); break;
	            }
	        }
	        break;
	    }
	    case 10: { // TAG_Compound
	        nbt_tags_read(sch, file);
	        break;
	    }
	    case 11: { // TAG_Int_Array
	        external_call(global.dll_SetPosition, file, external_call(global.dll_GetPosition, file) + external_call(global.dll_ReadInt, file));
	        break;
	    }
	}

	nbt_tags_read(sch, file);


}
