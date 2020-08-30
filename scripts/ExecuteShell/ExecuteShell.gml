function ExecuteShell() {
	/* 
	    ExecuteShell(fname, wait, hidden);
	    fname: file, program, or command to execute.
	    wait: wait for file to close before resume?
	    hidden: hide all files opened from command?
	    "hidden" is both optional and Windows-only.
	    "hidden" only works on files, not programs.
	    "hidden" can hide batch files' cmd windows.
	*/

	if (os_type == os_windows) 
	{
	    if (argument_count <= 2)
	        var ExecuteShell_result = external_call(external_define("ExecuteShell.dll", "ExecuteShell", dll_cdecl, ty_real, 2, ty_string, ty_real), argument[0], argument[1]);
	    else
	        var ExecuteShell_result = external_call(external_define("ExecuteShell.dll", "ExecuteShellEx", dll_cdecl, ty_real, 3, ty_string, ty_real, ty_real), argument[0], argument[1], argument[2]);

	    external_free("ExecuteShell.dll");
	    keyboard_clear(keyboard_lastkey);
	    mouse_clear(mouse_lastbutton);
	    return ExecuteShell_result;
	}

	if (os_type == os_macosx)
	{
	    var ExecuteShell_result = external_call(external_define("ExecuteShell.dylib", "ExecuteShell", dll_cdecl, ty_real, 2, ty_string, ty_real), argument[0], argument[1]);
	    external_free("ExecuteShell.dylib");
	    keyboard_clear(keyboard_lastkey);
	    mouse_clear(mouse_lastbutton);
	    return ExecuteShell_result;
	}

	if (os_type == os_linux) 
	{
	    var ExecuteShell_result = external_call(external_define("ExecuteShell.so", "ExecuteShell", dll_cdecl, ty_real, 2, ty_string, ty_real), argument[0], argument[1]);
	    external_free("ExecuteShell.so");
	    keyboard_clear(keyboard_lastkey);
	    mouse_clear(mouse_lastbutton);
	    return ExecuteShell_result;
	}


}
