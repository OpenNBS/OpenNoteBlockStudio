function message_yesnocancel(argument0, argument1) {
	// message_yesnocancel(text, caption)
	var a;
	EnvironmentSetVariable("IMGUI_DIALOG_CAPTION", string(argument1))
	a = ShowQuestionExt(string(argument0))
	return a


}
