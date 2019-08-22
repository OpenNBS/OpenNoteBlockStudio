//dat_preview(name, namespace, path)
//generate command preview text based on inputs

var name, namespace, path

name = argument0
namespace = argument1
path = argument2

if (string_lettersdigits(name) = "") {
	return "<enter name>"
} else {
	if (string_lettersdigits(namespace) = "") {
		return "/function "+string_path(name)+":play"
	} else {
		if (string_lettersdigits(path) = "") {
			return "/function "+string_path(namespace)+":"+string_path(name)+"/play"
		} else {
			return "/function "+string_path(namespace)+":"+dat_getpath(path)+"/"+string_path(name)+"/play"
		}
	}
}