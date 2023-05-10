// copy defaults insto sandbox to allow modification
directory_create(game_save_id)
execute_program("cp", @'-fR "' + filename_dir(bundled_data_directory) + @'" "' + filename_dir(data_directory) + @'"', true)
execute_program("cp", @'-fR "' + filename_dir(bundled_sounds_directory) + @'" "' + filename_dir(sounds_directory) + @'"', true)
execute_program("cp", @'-fR "' + filename_dir(bundled_songs_directory) + @'" "' + filename_dir(songs_directory) + @'"', true)
execute_program("cp", @'-fR "' + filename_dir(bundled_pattern_directory) + @'" "' + filename_dir(pattern_directory) + @'"', true)

// Use light theme to match default UI theme of OpenNBS:
EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(1));

// Start OpenNBS Maximized (macOS):
if (os_type == os_macosx) {
  // Maxmize window on startup
  external_call(external_define(current_directory + "libzoom.dylib", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
}

// Start OpenNBS Maximized (Linux):
if (os_type == os_linux) {
  var pid = 0;
  // Maxmize window on startup
  external_call(external_define(current_directory + "libzoom.so", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
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
