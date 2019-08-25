#define zip_impl_crc32
/// @description  @function zip_impl_crc32(buf:buffer, pos:int, len:int)->int
/// @param buf:buffer
/// @param  pos:int
/// @param  len:int
/// @param buf:buffer
/// @param pos:int
/// @param len:int
var buf = argument[0], pos = argument[1], len = argument[2];
var init = -1;
var crc = init;
var i = pos;
for (var _g = pos + len; i < _g; i += 1) {
	var tmp = ((crc ^ buffer_peek(buf, i, 1)) & 255);
	repeat (8) if ((tmp & 1) == 1) tmp = ((((tmp & $FFFFFFFF) >> 1)) ^ -306674912); else tmp = ((tmp & $FFFFFFFF) >> 1);
	crc = ((((crc & $FFFFFFFF) >> 8)) ^ tmp);
}
return (((crc ^ init) & $FFFFFFFF));

#define zip_impl_write
/// @description  @function zip_impl_write(dst:buffer, src:buffer, srcPos:int, srcLen:int)
/// @param dst:buffer
/// @param  src:buffer
/// @param  srcPos:int
/// @param  srcLen:int
/// @param dst:buffer
/// @param src:buffer
/// @param srcPos:int
/// @param srcLen:int
var dst = argument[0], src = argument[1], srcPos = argument[2], srcLen = argument[3];
var dstPos = buffer_tell(dst);
var dstNext = dstPos + srcLen;
var dstSize = buffer_get_size(dst);
if (dstNext > dstSize) {
	while (true) {
		dstSize *= 2;
		if (!(dstNext > dstSize)) break;
	}
	buffer_resize(dst, dstSize);
}
buffer_copy(src, srcPos, srcLen, dst, dstPos);
buffer_seek(dst, 0, dstNext);

#define zip_create
/// @description  @function zip_create(compressionLevel:int = -1)
/// @param compressionLevel:int = -1
/// @param compressionLevel:int=-1
var this = array_create(4);
var compressionLevel;
compressionLevel = argument_count > 0 ? argument[0]:-1;
this[@2/* open */] = true;
this[@1/* files */] = ds_list_create();
this[@0/* buffer */] = buffer_create(128, 1, 1);
this[@3/* compression_level */] = compressionLevel;
return this;

#define zip_destroy
/// @description  @function zip_destroy(this:zip)
/// @param this:zip
/// @param this:zip
var this = argument[0];
buffer_delete(this[0/* buffer */]);
this[@0/* buffer */] = -1;
ds_list_destroy(this[1/* files */]);
this[@1/* files */] = -1;
this[@2/* open */] = false;

#define zip_add_buffer_ext
/// @description  @function zip_add_buffer_ext(this:zip, path:string, buf:buffer, pos:int, len:int)
/// @param this:zip
/// @param  path:string
/// @param  buf:buffer
/// @param  pos:int
/// @param  len:int
/// @param this:zip
/// @param path:string
/// @param buf:buffer
/// @param pos:int
/// @param len:int
var this = argument[0], path1 = argument[1], buf = argument[2], pos = argument[3], len = argument[4];
if (!this[2/* open */]) show_error("Zip writer is already finalized.", false);
var compress = this[3/* compression_level */] != 0;
var o = this[0/* buffer */];
buffer_write(o, 6, 67324752);
buffer_write(o, 3, 20);
buffer_write(o, 3, 2048);
buffer_write(o, 3, (compress) ? 8 : 0);
var time = date_current_datetime();
buffer_write(o, 3, (((date_get_hour(time) << 11) | (date_get_minute(time) << 5)) | (date_get_second(time) >> 1)));
buffer_write(o, 3, (((date_get_year(time) - 1980 << 9) | (date_get_month(time) - 1 + 1 << 5)) | date_get_day(time)));
var crc = zip_impl_crc32(buf, pos, len);
var cbuf = undefined;
var clen = len;
if (compress) {
	cbuf = buffer_compress(buf, pos, len);
	clen = buffer_get_size(cbuf) - 6;
}
buffer_write(o, 5, crc);
buffer_write(o, 6, clen);
buffer_write(o, 6, len);
buffer_write(o, 3, string_byte_length(path1));
buffer_write(o, 3, 0);
buffer_write(o, 13, path1);
var file = [/* name: */path1, /* compressed: */compress, /* clen: */clen, /* size: */len, /* crc: */crc, /* date: */time];
if (compress) {
	zip_impl_write(o, cbuf, 2, clen);
	buffer_delete(cbuf);
} else zip_impl_write(o, buf, pos, len);
ds_list_add(this[1/* files */], file);

#define zip_add_buffer
/// @description  @function zip_add_buffer(this:zip, path:string, buf:buffer)
/// @param this:zip
/// @param  path:string
/// @param  buf:buffer
/// @param this:zip
/// @param path:string
/// @param buf:buffer
var this = argument[0], path1 = argument[1], buf = argument[2];
zip_add_buffer_ext(this, path1, buf, 0, buffer_get_size(buf));

#define zip_add_file
/// @description  @function zip_add_file(this:zip, path:string, filePath:string)
/// @param this:zip
/// @param  path:string
/// @param  filePath:string
/// @param this:zip
/// @param path:string
/// @param filePath:string
var this = argument[0], path1 = argument[1], filePath = argument[2];
var buf = buffer_load(filePath);
zip_add_buffer_ext(this, path1, buf, 0, buffer_get_size(buf));
buffer_delete(buf);

#define zip_finalize
/// @description  @function zip_finalize(this:zip)
/// @param this:zip
/// @param this:zip
var this = argument[0];
this[@2/* open */] = false;
var o = this[0/* buffer */];
var cdr_size = 0;
var cdr_offset = 0;
var _g_list = this[1/* files */];
var _g_index = 0;
while (_g_index < ds_list_size(_g_list)) {
	var f = _g_list[|_g_index++];
	var namelen = string_byte_length(f[0/* name */]);
	var extraFieldsLength = 0;
	buffer_write(o, 6, 33639248);
	buffer_write(o, 3, 20);
	buffer_write(o, 3, 20);
	buffer_write(o, 3, 2048);
	buffer_write(o, 3, (f[1/* compressed */]) ? 8 : 0);
	var d = f[5/* date */];
	buffer_write(o, 3, (((date_get_hour(d) << 11) | (date_get_minute(d) << 5)) | (date_get_second(d) >> 1)));
	buffer_write(o, 3, (((date_get_year(d) - 1980 << 9) | (date_get_month(d) - 1 + 1 << 5)) | date_get_day(d)));
	buffer_write(o, 5, f[4/* crc */]);
	buffer_write(o, 6, f[2/* clen */]);
	buffer_write(o, 6, f[3/* size */]);
	buffer_write(o, 3, namelen);
	buffer_write(o, 3, extraFieldsLength);
	buffer_write(o, 3, 0);
	buffer_write(o, 3, 0);
	buffer_write(o, 3, 0);
	buffer_write(o, 6, 0);
	buffer_write(o, 6, cdr_offset);
	buffer_write(o, 13, f[0/* name */]);
	cdr_size += 46 + namelen + extraFieldsLength;
	cdr_offset += 30 + namelen + extraFieldsLength + f[2/* clen */];
}
buffer_write(o, 6, 101010256);
buffer_write(o, 3, 0);
buffer_write(o, 3, 0);
buffer_write(o, 3, ds_list_size(this[1/* files */]));
buffer_write(o, 3, ds_list_size(this[1/* files */]));
buffer_write(o, 6, cdr_size);
buffer_write(o, 6, cdr_offset);
buffer_write(o, 3, 0);

#define zip_save
/// @description  @function zip_save(this:zip, path:string)
/// @param this:zip
/// @param  path:string
/// @param this:zip
/// @param path:string
var this = argument[0], path1 = argument[1];
if (this[2/* open */]) zip_finalize(this);
buffer_save_ext(this[0/* buffer */], path1, 0, buffer_tell(this[0/* buffer */]));

#define zip_get_buffer
/// @description  @function zip_get_buffer(this:zip)->buffer
/// @param this:zip
/// @param this:zip
var this = argument[0];
if (this[2/* open */]) zip_finalize(this);
return this[0/* buffer */];

