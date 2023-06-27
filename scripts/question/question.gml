function question(argument0, argument1) {
	// question(str, caption)
	var a;
	EnvironmentSetVariable("IMGUI_DIALOG_CAPTION", string(argument1))
	a = ShowQuestion(string(argument0))
	return a



}
