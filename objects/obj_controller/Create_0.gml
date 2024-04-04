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
  // Maxmize window on startup
  if (evaluate_command("uname", "-m") == "x86_64\n") external_call(external_define(current_directory + "libzoom.so", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
  else if (evaluate_command("uname", "-m") == "aarch64\n") external_call(external_define(current_directory + "libzoom_arm64.so", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
  else if (evaluate_command("uname", "-m") == "armv7l\n") external_call(external_define(current_directory + "libzoom_arm.so", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
}

// Do everything else for create event...
script_execute(control_create,0,0,0,0,0);
