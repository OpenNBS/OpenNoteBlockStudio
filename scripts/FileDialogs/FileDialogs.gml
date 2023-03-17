function ShowMessage(lpMessage) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --show-message "' + string(lpMessage) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace(string_replace(res, "\n", ""), "\r", "");
}

function ShowQuestion(lpMessage) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --show-question "' + string(lpMessage) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace(string_replace(res, "\n", ""), "\r", "");
}

function ShowQuestionExt(lpMessage) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --show-question-ext "' + string(lpMessage) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace(string_replace(res, "\n", ""), "\r", "");
}

function GetOpenFileName(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --get-open-filename-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
}

function GetOpenFileNames(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --get-open-filenames-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	res = string_replace_all(string_replace_all(res, "\r", ""), "\a", "");
	if (string_length(res)) res = string_copy(res, 0, string_length(res) - 1);
	return res;
}

function GetSaveFileName(lpFilter, lpFileName, lpDir, lpTitle) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	pid = ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --get-save-filename-ext "' + string(lpFilter) + @'" "' + string(lpFileName) + @'" "' + string(lpDir) + @'" "' + string(lpTitle) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
}

function GetDirectory(lpCapt, lpRoot) {
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	ProcessExecute(@'"' + game_save_id + "filedialogs." + ext + @'" --get-directory-alt "' + string(lpCapt) + @'" "' + string(lpRoot) + @'"');
	res = ExecutedProcessReadFromStandardOutput(pid);
	FreeExecutedProcessStandardOutput(pid);
	FreeExecutedProcessStandardInput(pid);
	return string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
}

function DialogGetFontFolder() {
	return string(EnvironmentGetVariable("IMGUI_FONT_PATH"));
}

function DialogSetFontFolder(lpParentFolder) {
	return bool(EnvironmentSetVariable("IMGUI_FONT_PATH", lpParentFolder));
}

function DialogGetFontFiles() {
	return string(EnvironmentGetVariable("IMGUI_FONT_FILES"));
}

function DialogSetFontFiles(lpFileNames) {
	return bool(EnvironmentSetVariable("IMGUI_FONT_FILES", lpFileNames));
}

function DialogGetFontSize() {
	return int64(EnvironmentGetVariable("IMGUI_FONT_SIZE"));
}

function DialogSetFontSize(dwSize) {
	return bool(EnvironmentSetVariable("IMGUI_FONT_SIZE", string(dwSize)));
}

function DialogGetWindowWidth() {
	return int64(EnvironmentGetVariable("IMGUI_DIALOG_WIDTH"));
}

function DialogGetWindowHeight() {
	return int64(EnvironmentGetVariable("IMGUI_DIALOG_HEIGHT"));
}

function DialogSetWindowSize(dwWidth, dwHeight) {
	return (bool(EnvironmentSetVariable("IMGUI_DIALOG_WIDTH", string(dwWidth))) && bool(EnvironmentSetVariable("IMGUI_DIALOG_HEIGHT", string(dwHeight))));
}

function DialogGetOwnerWindow() {
	return ptr(int64(EnvironmentGetVariable("IMGUI_DIALOG_PARENT")));
}

function DialogSetOwnerWindow(lpOwner) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_PARENT", string(int64(lpOwner))));
}

function DialogGetWindowCaption() {
	return string(EnvironmentGetVariable("IMGUI_DIALOG_CAPTION"));
}

function DialogSetWindowCaption(lpCaption) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_CAPTION", string(lpCaption)));
}

function DialogGetResizeable() {
	return bool(EnvironmentGetVariable("IMGUI_DIALOG_RESIZE"));
}

function DialogSetResizeable(bResizeable) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_RESIZE", string(bool(bResizeable))));
}

function DialogGetBorderless() {
	return bool(EnvironmentGetVariable("IMGUI_DIALOG_NOBORDER"));
}

function DialogSetBorderless(bBorderless) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_NOBORDER", string(bool(bBorderless))));
}

function DialogGetFullScreen() {
	return bool(EnvironmentGetVariable("IMGUI_DIALOG_FULLSCREEN"));
}

function DialogSetFullScreen(bFullScreen) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_FULLSCREEN", string(bool(bFullScreen))));
}

function DialogGetColorTheme() {
	return int64(EnvironmentGetVariable("IMGUI_DIALOG_THEME"));
}

function DialogGetDarkTheme() {
	return 0;
}

function DialogGetLightTheme() {
	return 1;
}

function DialogGetClassicTheme() {
	return -1;
}

function DialogSetColorTheme(nTheme) {
	return bool(EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(nTheme)));
}

function DialogInitialize() {
	directory_create(game_save_id);
	if (os_type == os_windows) ext = "exe";
	else if (os_type == os_macosx) ext = "app";
	else ext = "elf";
	if (os_type != os_macosx) EnvironmentSetVariable("IMGUI_DIALOG_PARENT", string(int64(window_handle())));
	file_copy(string_lower("Data/CLI/filedialogs." + ext), game_save_id + "filedialogs." + ext);
	ProcessExecute(@'chmod +x "' + game_save_id + "filedialogs." + ext + @'"')
	DialogSetWindowCaption(window_get_caption());
	DialogSetColorTheme(DialogGetLightTheme());
	DialogSetResizeable(true);
	DialogSetFontSize(16);
	DialogSetFontFiles(working_directory + string_lower("Data/Fonts/NotoSans-Regular.ttf"));
	DialogSetWindowSize(640, 360);
}

DialogInitialize();
