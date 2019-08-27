//dat_preview(name, namespace, path)
//generate command preview text based on inputs

var name, namespace, path, preview

name = argument0
namespace = argument1
path = argument2

if (string_lettersdigits(name) = "") {
	preview = "<enter name>"
} else {
	if (string_lettersdigits(namespace) = "") {
		preview = "/function "+string_path(name)+":play"
	} else {
		if (string_lettersdigits(path) = "") {
			preview = "/function "+string_path(namespace)+":"+string_path(name)+"/play"
		} else {
			preview = "/function "+string_path(namespace)+":"+dat_getpath(path)+"/"+string_path(name)+"/play"
		}
	}
}

return string_maxwidth(preview, 350) + condstr(string_width(preview) > 350, "...")