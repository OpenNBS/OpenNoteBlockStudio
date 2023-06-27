function message(argument0, argument1) {
	// message(str, caption)
	log(argument1, argument0)
	EnvironmentSetVariable("IMGUI_DIALOG_CAPTION", string(argument1))
	a = ShowMessage(string(argument0))



}
