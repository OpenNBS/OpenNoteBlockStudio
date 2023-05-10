// Use light theme to match default UI theme of OpenNBS:
EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(1));

// Start OpenNBS Maximized (Linux):
if (os_type == os_linux) {
  var pid = 0;
  // Maxmize window on startup
  external_call(external_define(program_directory + "assets/libzoom.so", "window_zoom", dll_cdecl, ty_real, 1, ty_string), window_handle());
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
