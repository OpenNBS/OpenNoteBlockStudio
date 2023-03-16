function message(argument0, argument1 = "(null)") {
	// message(text, caption)
	var a, b, c, d;
	log(argument1, argument0)
	b = DialogGetWindowCaption()
	DialogSetWindowCaption(((argument1 == "(null)") ? "" : argument1))
	c = DialogGetWindowWidth();
	d = DialogGetWindowHeight();
	DialogSetWindowSize(320, 200);
	a = (ShowMessage(argument0) == environment_get_variable("IMGUI_OK"))
	DialogSetWindowSize(c, d)
	DialogSetWindowCaption(b)
	return a

}
