function question(argument0, argument1) {
	// question(str, caption)
	var a, b, c, d, e;
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(argument1)
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(320, 200);
	e = ShowQuestion(argument0)
	if (e == environment_get_variable("IMGUI_YES")) a = true;
	if (e == environment_get_variable("IMGUI_NO")) a = false;
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a



}
