// selection_to_array(string)
var array = undefined
var at = 0
var sel_str = argument0
var sub_str = ""
var main_str = string_delete(sel_str, string_length(sel_str), 1)
for(var i = 1; i < string_length(main_str)+1; i++)
{
   var next_char = string_char_at(main_str,i)
 
	if (next_char != "|") {
       sub_str = sub_str + next_char
   }
   else {
       //ADD TO ARRAY
       if(sub_str!="") array[at++] = sub_str
       sub_str = ""
   }
}
if(sub_str!="") array[at++] = sub_str
return array