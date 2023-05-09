// Use light theme to match default UI theme of OpenNBS:
EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(1));

if (os_type == os_linux) {
  var pid = 0;
  if (file_exists("/usr/bin/wmctrl")) {
    // Requires "wmctrl" installed
    // sudo apt-get install wmctrl
    pid = ProcessExecute(wmctrl -i " + string(int64(window_handle())) + " -b toggle,maximized_vert,maximized_horz");
  } else if (file_exists("/usr/bin/xdotool")) {
    // Requires "xdotool" installed
    // sudo apt-get install xdotool
    pid = ProcessExecute("xdotool windowsize " + string(int64(window_handle())) + " 100% 100%");
  }
  // Successful execution. That means it worked ok. 
  // Now free stdin/stdout/stderr file descriptors.
  if (pid) {
    FreeExecutedProcessStandardOutput(pid);
    FreeExecutedProcessStandardInput(pid);
  }
}

// Do everything else for create event...
script_execute(control_create,0,0,0,0,0);
