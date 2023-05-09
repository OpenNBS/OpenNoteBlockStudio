#define _DialogInitialize
	EnvironmentSetVariable("IMGUI_DIALOG_PARENT", string(int64(window_handle())));
	if (os_type != os_linux) {
		EnvironmentSetVariable("IMGUI_FONT_PATH", working_directory + string_lower("Fonts"));
		_IfdLoadFonts();
	} else {
		EnvironmentSetVariable("IMGUI_FONT_PATH", program_directory + "assets/" + string_lower("Fonts"));
		pid = ProcessExecute("uname -m");
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace(string_replace(res, "\n", ""), "\r", "");
		if (res == "x86_64" || res == "amd64") res = ".so";
		else if (res == "aarch64" || res == "arm64") res = "_arm64.so";
		else if (res == "armv7l" || res == "armhf") res = "_arm.so";
		directory_create(game_save_id);
		file_copy(program_directory + "assets/libfiledialogs" + res, game_save_id + "filedialogs.AppImage");
		pid = ProcessExecute(@'chmod +x "' + game_save_id + @'filedialogs.AppImage"');
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
	}

#define ShowMessage
	if (os_type != os_linux) {
		_ShowMessage(string(argument0));
		return 1;
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --show-message "' + string(argument0) + @'" 2> /dev/null');
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
	}
	return 1;

#define ShowQuestion
	if (os_type != os_linux) {
		res = _ShowQuestion(string(argument0));
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --show-question "' + string(argument0) + @'" 2> /dev/null');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace(string_replace(res, "\n", ""), "\r", "");
	}
	return ((EnvironmentGetVariable("IMGUI_YES") != "") ? (res == EnvironmentGetVariable("IMGUI_YES")) : (res == "Yes"));

#define ShowQuestionExt
	if (os_type != os_linux) {
		res = _ShowQuestionExt(string(argument0));
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --show-question-ext "' + string(argument0) + @'" 2> /dev/null');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace(string_replace(res, "\n", ""), "\r", "");
	}
	if ((EnvironmentGetVariable("IMGUI_YES") != "") ? (res == EnvironmentGetVariable("IMGUI_YES")) : (res == "Yes")) {
		return 1;
	} else if ((EnvironmentGetVariable("IMGUI_NO") != "") ? (res == EnvironmentGetVariable("IMGUI_NO")) : (res == "No")) {
		return 0;
	}
	return -1;

#define GetString
	if (os_type != os_linux) {
		res = _GetString(string(argument0), string(argument1));
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --get-string "' + string(argument0) + @'" "' + string(argument1) + @'" 2> /dev/null');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace(string_replace(res, "\n", ""), "\r", "");
	}
	return res;

#define GetNumber
	if (os_type != os_linux) {
		res = _GetNumber(string(argument0), real(argument1));
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --get-number "' + string(argument0) + @'" "' + string(argument1) + @'" 2> /dev/null');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace(string_replace(res, "\n", ""), "\r", "");
	}
	return real(res);

#define GetOpenFileName
	if (os_type != os_linux) {
		res = _GetOpenFileName(string(argument0), string(argument1), string(argument2), string(argument3));
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --get-open-filename-ext "' + string(argument0) + @'" "' + string(argument1) + @'" "' + string(argument2) + @'" "' + string(argument3) + @'" 2> /dev/null');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
	}
	if (res == "(null)") res = "";
	return res;

#define GetOpenFileNames
	if (os_type != os_linux) {
		res = _GetOpenFileNames(string(argument0), string(argument1), string(argument2), string(argument3));
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --get-open-filenames-ext "' + string(argument0) + @'" "' + string(argument1) + @'" "' + string(argument2) + @'" "' + string(argument3) + @'" 2> /dev/null');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace_all(string_replace_all(res, "\r", ""), "\a", "");
		if (string_length(res)) res = string_copy(res, 0, string_length(res) - 1);
	}
	if (res == "(null)") res = "";
	return res;

#define GetSaveFileName
	if (os_type != os_linux) {
		res = _GetSaveFileName(string(argument0), string(argument1), string(argument2), string(argument3));
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --get-save-filename-ext "' + string(argument0) + @'" "' + string(argument1) + @'" "' + string(argument2) + @'" "' + string(argument3) + @'" 2> /dev/null');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
	}
	if (res == "(null)") res = "";
	return res;

#define GetDirectory
	if (os_type != os_linux) {
		res = _GetDirectory(string(argument0), string(argument1));
	} else {
		pid = ProcessExecute(@'"' + game_save_id + @'filedialogs.AppImage" --get-directory-alt "' + string(argument0) + @'" "' + string(argument1) + @'" 2> /dev/null');
		res = ExecutedProcessReadFromStandardOutput(pid);
		FreeExecutedProcessStandardOutput(pid);
		FreeExecutedProcessStandardInput(pid);
		res = string_replace_all(string_replace(string_replace(res, "\n", ""), "\r", ""), "\a", "");
	}
	if (res == "(null)") res = "";
	return res;
