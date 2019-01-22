// read_tags()
var a, b, prevpos, tagtype, tagname;

tagtype = buffer_read_byte()
if (tagtype = 0) return 1
tagname = buffer_read_string_short_be()
if (tagtype = 1) { // TAG_Byte
    a = buffer_read_byte()
    if (tagname = "note") nb_n = a
} else if (tagtype = 2) { // TAG_Short
    a = buffer_read_short_be()
    if (tagname = "Width") sch_width = a
    else if (tagname = "Height") sch_height = a
    else if (tagname = "Length") sch_length = a
} else if (tagtype = 3) { // TAG_Int
    a = buffer_read_int_be()
    if (tagname = "x") nb_y = sch_width - 1 - a
    else if (tagname = "y") nb_z = a
    else if (tagname = "z") nb_x = a
    else if (tagname = "WEOffsetX") offsetx = a
    else if (tagname = "WEOffsetY") offsety = a
    else if (tagname = "WEOffsetZ") offsetz = a
} else if (tagtype = 4) { // TAG_Long
    buffer_skip(4)
} else if (tagtype = 5) { // TAG_Float
    buffer_skip(4)
} else if (tagtype = 6) { // TAG_Double
    buffer_skip(8)
} else if (tagtype = 7) { // TAG_Byte_Array
    a = buffer_read_int_be() // Size
    if (tagname = "Blocks") blockspos = buffer_tell(buffer)
    else if (tagname = "Data") datapos = buffer_tell(buffer)
    buffer_skip(a)
} else if (tagtype = 8) { // TAG_String
    buffer_read_string_short_be()
} else if (tagtype = 9) { // TAG_List
    b = buffer_read_byte() // type
    a = buffer_read_int_be()
    repeat (a) {
        if (b = 10) {
            read_tags()
            if (tagname = "TileEntities") {
                if (nb_n > -1) {
                    noteblock_x[noteblocks] = nb_x
                    noteblock_y[noteblocks] = nb_y
                    noteblock_z[noteblocks] = nb_z
                    noteblock_n[noteblocks] = nb_n
                    noteblocks += 1
                    nb_n = -1
                }
            }
        } else {
            if (b = 1) buffer_read_byte()
            if (b = 2) buffer_read_short_be()
            if (b = 3) buffer_read_int_be()
            if (b = 4) {buffer_skip(4)}
            if (b = 5) {buffer_skip(4)}
            if (b = 6) {buffer_skip(8)}
        }
    }
} else if (tagtype = 10) {
    read_tags()
}
read_tags()
