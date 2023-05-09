// Use light theme to match default UI theme of OpenNBS:
EnvironmentSetVariable("IMGUI_DIALOG_THEME", string(1));

if (os_type == os_linux) {
  // Requires "xdotool" installed
  // sudo apt-get install xdotool
  var pid = ProcessExecute("xdotool windowsize " + string(int64(window_handle())) + " 100% 100%")
  FreeExecutedProcessStandardOutput(pid);
  FreeExecutedProcessStandardInput(pid);
}

// Do everything else for create event...
script_execute(control_create,0,0,0,0,0);
