function buffer_read_varlen() {
	// buffer_read_varlen()

	var Result, Byte;
	Result = 0;
	do 
	{
	    Byte = buffer_read_byte();
	    Result = (Result << 7 ) | (Byte & $7F);
	} until (Byte < $80)
	return Result;





}
