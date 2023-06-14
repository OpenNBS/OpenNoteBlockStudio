// copy defaults into sandbox to allow modification
directory_create(game_save_id)
if (os_type != os_windows) {
  if (!directory_exists(data_directory)) execute_program("cp", @'-fR "' + filename_dir(bundled_data_directory) + @'" "' + filename_dir(data_directory) + @'"', true)
  if (!directory_exists(songs_directory)) execute_program("cp", @'-fR "' + filename_dir(bundled_songs_directory) + @'" "' + filename_dir(songs_directory) + @'"', true)
  if (!directory_exists(pattern_directory)) execute_program("cp", @'-fR "' + filename_dir(bundled_pattern_directory) + @'" "' + filename_dir(pattern_directory) + @'"', true)
} else {
  if (!directory_exists(data_directory)) execute_program("Xcopy", @'/E /I "' + filename_dir(bundled_data_directory) + @'" "' + filename_dir(data_directory) + @'"', true)
  if (!directory_exists(songs_directory)) execute_program("Xcopy", @'/E /I "' + filename_dir(bundled_songs_directory) + @'" "' + filename_dir(songs_directory) + @'"', true)
  if (!directory_exists(pattern_directory)) execute_program("Xcopy", @'/E /I "' + filename_dir(bundled_pattern_directory) + @'" "' + filename_dir(pattern_directory) + @'"', true)
}

// Use light theme to match default UI theme of OpenNBS:
EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(1));
EnvironmentSetVariable("IMGUI_DIALOG_NOBORDER", string(1));

function evaluate_command(prog, arg) {
  prog = string_replace_all(prog, @'\', @'\\');
  prog = string_replace_all(prog, @'"', @'\"');
  if (os_type == os_windows && 
    (string_lower(filename_name(prog)) == "cmd" ||
    string_lower(filename_name(prog)) == "cmd.exe")) 
  { prog = "cmd.exe"; arg = "/c " + arg; } 
  prog = @'"' + prog + @'"'; var pre = "";
  if (os_type == os_windows) pre = "cmd /c";
  var pid = ProcessExecute(pre + " " + prog + " " + arg);
  var out = ExecutedProcessReadFromStandardOutput(pid);
  FreeExecutedProcessStandardInput(pid);
  FreeExecutedProcessStandardOutput(pid);
  return out;
}

// Start OpenNBS Maximized (macOS):
if (os_type == os_macosx) {
  // Maxmize window on startup
  external_call(external_define(current_directory + "libzoom.dylib", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
}

// Start OpenNBS Maximized (Linux):
if (os_type == os_linux) {
  var pid = 0;
  // Maxmize window on startup
  if (evaluate_command("uname", "-m") == "x86_64\n") external_call(external_define(current_directory + "libzoom.so", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
  else if (evaluate_command("uname", "-m") == "aarch64\n") external_call(external_define(current_directory + "libzoom_arm64.so", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
  else if (evaluate_command("uname", "-m") == "armv7l\n") external_call(external_define(current_directory + "libzoom_arm.so", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
  if (evaluate_command("uname", "-m") == "aarch64\n" || evaluate_command("uname", "-m") == "armv7l\n") {
    // The Raspberry Pi and similar ARM devices can't handle combining tons of font files like we're doing
	// on x86 platforms, use English-only; it's better than having no fonts displaying correctly at all...
    execute_program("cp", "-fR \"" + current_directory + "/fonts\" \"" + file_directory + "/\"", true);
	directory_create(file_directory + "/fonts/arm/");
    execute_program("mv", "-f \"" + file_directory + "/fonts/000-notosans-regular.ttf\" \"" + file_directory + "/fonts/arm/000-notosans-regular.ttf\"", true);
    EnvironmentSetVariable("IMGUI_FONT_PATH", file_directory + "/fonts/arm/");
  }
  // Ignore this pls:
  _DialogInitialize();
  // Compensate for weird bug I don't know how to fix, with lowercase being forced calling file_copy(); it makes no sense:
  pid = ProcessExecute("mv -f \"" + game_save_id + "filedialogs.appimage\" \"" + game_save_id + "filedialogs.AppImage\" && chmod +x  \"" + game_save_id + "filedialogs.AppImage\"");
  // Successful execution. That means it worked ok. 
  // Now free stdin/stdout/stderr file descriptors.
  if (pid) {
    FreeExecutedProcessStandardOutput(pid);
    FreeExecutedProcessStandardInput(pid);
  }
  // Done with Linux-specific initialization code...
  // Go hog wild! :D
}

// Do everything else for create event...
script_execute(control_create,0,0,0,0,0);
