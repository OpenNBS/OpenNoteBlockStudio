function message_yesnocancel(argument0, argument1) {
	// message_yesnocancel(text, caption)
	var a, b, c, d, e;
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(argument1)
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(320, 200);
	e = ShowQuestionExt(argument0)
	if (e == environment_get_variable("IMGUI_YES")) a = 1;
	if (e == environment_get_variable("IMGUI_NO")) a = 0;
	if (e == environment_get_variable("IMGUI_CANCEL")) a = -1;
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a


}
