widget_set_owner(hwnd_main);
widget_set_icon(working_directory + "icon.png");
environment_set_variable("IMGUI_FONT_PATH", data_directory + "fonts");
environment_set_variable("IMGUI_FONT_SIZE", "24");
environment_set_variable("IMGUI_DIALOG_WIDTH", "800");
environment_set_variable("IMGUI_DIALOG_HEIGHT", "400");
IfdLoadFonts();

