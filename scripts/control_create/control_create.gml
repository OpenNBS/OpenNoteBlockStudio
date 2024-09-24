function control_create() {
	// control_create()

	globalvar buffer, window_width, window_height, window_background;
	var a, b, c, w, h, str, str2;

	// Initialize logging
	log_init()

	// Initialize DLLs
	if (os_type = os_windows) lib_init()

	// Window
	#macro RUN_FROM_IDE parameter_count()==3&&string_count("GMS2TEMP",parameter_string(2))
	p_num = parameter_count()
	isplayer = (check_args("--player") || check_args("-p"))
	filenamearg = check_args("--song", 1)
	if (filenamearg = 0 || filenamearg = -1) filenamearg = check_args()
	//if (RUN_FROM_IDE != 1) isplayer = 1
	destroy_self = 0
	port_taken = 0
	server_socket = -1
	if (!isplayer) server_socket = network_create_server(network_socket_tcp, 30010, 1)
	client_socket = -1
	if (server_socket < 0 && !isplayer) {port_taken = 1; client_socket = network_create_socket(network_socket_tcp)}
	if (parameter_count() > 0) {
		if (filenamearg != "" && (filename_ext(filenamearg) = ".mid" || filename_ext(filenamearg) = ".midi" || filename_ext(filenamearg) = ".schematic" || filename_ext(filenamearg) = ".nbs")) {
			if (port_taken) {
				network_connect(client_socket, "127.0.0.1", 30010)
				var temp_buffer = buffer_create(0, buffer_grow, 1)
				buffer_write(temp_buffer, buffer_s8, 10)
				buffer_write(temp_buffer, buffer_string, filenamearg)
				network_send_packet(client_socket, temp_buffer, buffer_get_size(temp_buffer))
				buffer_delete(temp_buffer)
				destroy_self = 1
				log("Sended opening song path, closing...")
				game_end()
			}
		}
	}
	if (!destroy_self) {
	window_width = 0
	window_height = 0
	if (!isplayer) window_maximize()
	window_set_focus()
	window_set_min_width(800)
	window_set_min_height(500)
	window_scale = get_default_window_scale()
	if (window_scale > 2 && is_mobile()) window_scale = 2
	var temp_font_size = floor(15 * window_scale * (1 + (os_type != os_macosx || window_scale = 1)))
	if (temp_font_size > 40) temp_font_size = 40
	cam_window = camera_create()
	view_set_camera(0, cam_window)
	window_background = c_white
	prev_scale = -1
	rw = 0
	rh = 0
	windowprogress = 0
	windowalpha = 0
	windowoffset = 0
	windowanim = 0
	windowopen = 0
	windowclose = 0
	windowsound = 0
	msgalpha = 1 // Init bottom message transparency
	showmsg = 0 // Displays message when set to 1
	msgcontent = ""
	msgstart = 0
	currentfont = 0
	acrylic = (os_type = os_windows)
	can_draw_mica = 1
	mouseover = 0
	display_width = display_get_width()
	display_height = display_get_height()
	window_icon = 0
	if (os_type = os_windows) {
		icon_buffer = window_set_icon_impl_load(bundled_data_directory + "icon.ico")
		icon_size_buffer = window_set_icon_impl_argbuf()
		buffer_write(icon_size_buffer, buffer_u32, buffer_get_size(icon_buffer))
		buffer_write(icon_size_buffer, buffer_u32, $80004005)
		buffer_write(icon_size_buffer, buffer_string, "DLL is not loaded")
	}
	icon_time = -1
	last_icon = -1
	icon_display = 1
	hires = (window_scale > 1.25)
	if (os_type = os_macosx) hires = 0
	
	font_table =
	[
		[ // normal fonts
			[ fnt_main,          fnt_wslui,               fnt_src               ], // font_main
			[ fnt_mainbold,      fnt_wslui_bold,          fnt_src_bold          ], // font_main_bold
			[ fnt_small,         fnt_wslui_small,         fnt_src_small         ], // font_small
			[ fnt_smallbold,     fnt_wslui_small_bold,    fnt_src_small_bold    ], // font_small_bold
			[ fnt_info_big,      fnt_wslui_info_big,      fnt_src_info_big      ], // font_info_big
			[ fnt_info_med,      fnt_wslui_info_med,      fnt_src_info_med      ], // font_info_med
			[ fnt_info_med_bold, fnt_wslui_info_med_bold, fnt_src_info_med_bold ], // font_info_med_bold
			[ fnt_wslui_med,     fnt_wslui_med,           fnt_src_med           ], // font_med
			[ fnt_symbol_small,  fnt_symbol_small,        fnt_symbol_small      ]
		],
		[ // hires fonts
			[ fnt_main,          fnt_wslui_hires,               fnt_src_hires               ], // font_main
			[ fnt_mainbold,      fnt_wslui_bold_hires,          fnt_src_bold_hires          ], // font_main_bold
			[ fnt_small,         fnt_wslui_small_hires,         fnt_src_small_hires         ], // font_small
			[ fnt_smallbold,     fnt_wslui_small_bold_hires,    fnt_src_small_bold_hires    ], // font_small_bold
			[ fnt_info_big,      fnt_wslui_info_big_hires,      fnt_src_info_big_hires      ], // font_info_big
			[ fnt_info_med,      fnt_wslui_info_med_hires,      fnt_src_info_med_hires      ], // font_info_med
			[ fnt_info_med_bold, fnt_wslui_info_med_bold_hires, fnt_src_info_med_bold_hires ], // font_info_med_bold
			[ fnt_wslui_med,     fnt_wslui_med_hires,           fnt_src_med_hires           ], // font_med
			[ fnt_symbol_small,  fnt_symbol_small_hires,        fnt_symbol_small_hires      ]
		]
	]
	
	// Wallpaper
	wpaper = 0
	wpaperexist = 0
	wpaperside = 0
	wpaperwidth = 0
	wpaperblur = 0

	// Audio
	channels = 256
	channelstoggle = 0
	sounds = 0
	audio_channel_num(channels)
	show_soundcount = 0

	// Application
	update = 0
	check_update = 1
	check_prerelease = 0
	update_success = 0
	show_welcome = 1
	scroll_wheel = 0
	theme = 3 // Using Fluent as the default theme
	fdark = 0 // Fluent dark mode
	blackout = 0
	editmode = 0
	clickinarea = 0
	dontplace = 0
	vers = version
	menu_shown = ""
	show_oldwarning = 1
	songfolder = songs_directory
	patternfolder = pattern_directory
	icons_init()
	refreshrate = 0 //0 = 30fps, 1 = 60fps, 2 = 120fps, 3 = 144fps, 4 = Unlimited
	fade = 0
	rhval = 270
	fullscreen = 0
	autosave = 0
	autosavemins = 10
	tonextsave = 0
	backupmins = 1
	tonextbackup = 0
	language = 1 * (os_get_language() = "zh" && os_get_region() = "CN")
	presence = 1 // Discord RPC toggle
	// presencewindow = 0
	aa = 0
	accent1 = 0
	accent2 = 120
	accent3 = 212
	hsv[2] = 0
	rr = 0
	gg = 0
	bb = 0
	hsdrag = 0
	vdrag = 0
	nocdrag = 0
	resetcolor = 0
	rainbow = 0
	rainbowtoggle = 0
	pingtime = current_time
	debug_overlay = check_args("--debug")
	debug_option = 0
	os_info = os_get_info()
	is_yyc = code_is_compiled()
	if (is_yyc) output_format = "Native"
	else output_format = "VM"
	volume_scroll = 0
	remove_effect = 1
	dragincxr = 0
	dragincxl = 0
	dragincyd = 0
	dragincyu = 0
	tabdrag = 0
	draggingtab = -1
	tabdest = -1

	// Instruments
	//current_resource = "Vanilla"
	current_resource = "Vanilla"
	resourcepacks = []
	array_push(resourcepacks, new_resourcepack(0, "Vanilla"))
	pack_to_push = file_find_first(resource_directory + "*", fa_directory)
	var pack_ext = 0
	while (pack_to_push != "") {
		//if (filename_ext(pack_to_push) = ".zip") pack_ext = 1
		if (filename_ext(pack_to_push) = ".zip") pack_ext = 0 // disable zip for now
		else if (filename_ext(pack_to_push) = "") pack_ext = 2
		else if (directory_exists(resource_directory + pack_to_push)) pack_ext = 2
	    if (pack_ext != 0) array_push(resourcepacks, new_resourcepack(pack_ext, pack_to_push))
		show_debug_message(pack_to_push)
	    pack_to_push = file_find_next()
	}
	file_find_close()
	
	original_instruments = []
	array_push(original_instruments, new_instrument("Harp",          "harp.ogg",     false, true))
	array_push(original_instruments, new_instrument("Double Bass",   "dbass.ogg",    false, true))
	array_push(original_instruments, new_instrument("Bass Drum",     "bdrum.ogg",    false))
	array_push(original_instruments, new_instrument("Snare Drum",    "sdrum.ogg",    false))
	array_push(original_instruments, new_instrument("Click",         "click.ogg",    false))
	array_push(original_instruments, new_instrument("Guitar",        "guitar.ogg",   false, true))
	array_push(original_instruments, new_instrument("Flute",         "flute.ogg",    false, true))
	array_push(original_instruments, new_instrument("Bell",          "bell.ogg",     false, true))
	array_push(original_instruments, new_instrument("Chime",         "icechime.ogg", false, true))
	array_push(original_instruments, new_instrument("Xylophone",     "xylobone.ogg", false, true))
	array_push(original_instruments, new_instrument("Iron Xylophone","iron_xylophone.ogg", false, true))
	array_push(original_instruments, new_instrument("Cow Bell",      "cow_bell.ogg", false, true))
	array_push(original_instruments, new_instrument("Didgeridoo",    "didgeridoo.ogg", false, true))
	array_push(original_instruments, new_instrument("Bit",           "bit.ogg", false, true))
	array_push(original_instruments, new_instrument("Banjo",         "banjo.ogg", false, true))
	array_push(original_instruments, new_instrument("Pling",         "pling.ogg", false, true))
	
	// Navigating sounds
	str = ""
	soundinvoke = create(obj_instrument)
	soundinvoke.key = 45
	soundinvoke.filename = "ui/invoke.ogg"
	soundinvoke.user = 0
	soundshow =   create(obj_instrument)
	soundshow.key =   45
	soundshow.filename =     "ui/show.ogg"
	soundshow.user =   0
	soundhide =   create(obj_instrument)
	soundhide.key =   45
	soundhide.filename =     "ui/hide.ogg"
	soundhide.user =   0
	soundgoback = create(obj_instrument)
	soundgoback.key = 45
	soundgoback.filename = "ui/goback.ogg"
	soundgoback.user = 0
	soundmetronome = create(obj_instrument)
	soundmetronome.key = 45
	soundmetronome.filename = "ui/metronome.ogg"
	soundmetronome.user = 0
	soundding = create(obj_instrument)
	soundding.key = 45
	soundding.filename = "ui/ding.ogg"
	soundding.user = 0
	soundmetronomeclick = create(obj_instrument)
	soundmetronomeclick.key = 45
	soundmetronomeclick.filename = "ui/metronome_click.ogg"
	soundmetronomeclick.user = 0

	first_custom_index = array_length(original_instruments)

	insmenu = 0
	emitters_to_remove = ds_list_create()
	
	// Initialize instruments
	str = ""
	with (obj_instrument)
	    if (!instrument_load())
	        str += filename + "\n"
	if (str != "") message("The following file(s) could not be found:\n\n" + str + "\n\nSome sounds might not play.", "Error")

	log("Instruments loaded")

	// File
	songs = []
	array_push(songs, create(obj_song))
	song = 0
	for (a = 0; a < 11; a += 1) {
	    mididevice_instrument[a] = -1
	    recent_song[a] = ""
	    recent_song_time[a] = 0
	}
	if (os_type = os_ios) recent_song[0] = bundled_songs_directory + "the_ground's_colour_is_yellow.nbs"
	file_dnd_set_hwnd(hwnd_main)
	file_dnd_set_enabled(true)
	dndfile = ""
	lastfile = ""
	menutab = -1

	// Playback
	audio_listener_orientation(0,1,0, 0,0,1)
	audio_listener_position(100,0,1)
	playing = 0
	record = 0
	mastervol = 1
	tempodrag = 10
	bpm = 0
	use_bpm = 0
	metronome = 0
	metronome_played = -1
	marker_follow = 1
	marker_pagebypage = 1
	marker_start = 1
	marker_end = 0
	marker_return = 1
	forward = 0
	timeline_pressa = -1
	for (a = 0; a < 10000; a += 1) text_exists[a] = 0
	currspeed = 0
	taskbar = 1

	// Note blocks
	midi_devices = 0

	show_numbers = 1
	show_octaves = 0
	use_colors = 1
	use_icons = 0
	use_shapes = 0
	show_incompatible = 1

	mousewheel = 0
	changepitch = 1
	
	keynames = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"];
	keynames_flat = 0

	// Selecting
	select = 0
	drag = 0
	drag_pressx = -1
	drag_pressy = -1
	select_pressx = -1
	select_pressy = -1
	select_pressa = -1
	select_pressb = -1

	selection_copied = ""

	// Layers
	show_layers = 1
	realvolume = 1
	realstereo = 0
	dragvolb = 0
	dragvol = 0
	dragstereob = 0
	dragstereo = 0

	// Piano
	show_piano = 1
	show_keynames = 1
	show_keynumbers = 0
	show_keyboard = 1
	show_notechart = 0
	show_outofrange = 1
	editline = 0
	piano_key[87] = 0
	key_press[87] = 0
	key_midipress[87] = 0
	key_click[87] = 0
	key_played[87] = 0
	key_edit = -1
	init_keys()
	selected_key = 39
	selected_vel = 100
	selected_pan = 100
	selected_pit = 0
	startkey = 0
	sharpkeys = 0
	keysshow = 0
	keysmax = 30
	select_lastpressed = 1
	record = 0
	record_round = 0
	warning_octaves = 0
	warning_instrument = 0
	warning_schematic = 0
	tutorial_tempobox = 0

	// Interface
	window = 0
	prevwindow = 0
	selected_tab = 0
	global.popup = 0
	globalvar text_focus;
	globalvar text_select, text_exists, text_str, text_start, text_line, text_line_wrap, text_line_single, text_lines;
	globalvar text_sline, text_spos, text_eline, text_epos, text_cline, text_cpos, text_mline, text_mpos;
	globalvar text_click, text_marker, text_key_delay, text_lastwidth, text_laststr, text_lastfocus, text_mouseover, text_chars, text_clipboard;
	text_select = -1
	text_exists[10000] = 0
	text_click = current_time
	text_marker = 0
	text_key_delay[7] = 0
	text_lastfocus = -1
	text_mouseover = []
	text_focus = -1
	text_clipboard = ""

	globalvar sb_count, sb_drag, sb_mprev, sb, sb_press, sb_sel;
	sb_count = 0
	sb_drag = -1;
	sb_mprev = 0;
	sb_sel = 0
	scrollbarh = create_scrollbar(0)
	scrollbarv = create_scrollbar(1)
	statscrollbarv = create_scrollbar(1)
	insscrollbar = create_scrollbar(1)
	midi_sb1 = create_scrollbar(1)
	midi_sb2 = create_scrollbar(1)
	midi_sb3 = create_scrollbar(1)
	midi_sb4 = create_scrollbar(1)
	sch_exp_scrollbar = create_scrollbar(1)
	update_scrollbar = create_scrollbar(1)
	credits_scrollbar = create_scrollbar(1)
	sbh_anim = 0
	sbv_anim = 0
	showinsbox = 0
	delay = 0
	insedit = -1
	insselect = -1
	mouse_xprev = mouse_x
	mouse_yprev = mouse_y
	asso_nbs = 1
	asso_midi = 0
	asso_sch = 0
	w_asso_start = 1
	wmenu = 0
	looptobarend = 1
	timestoloop = songs[song].loopmax
	settempo = 0 // Tempo input box clicked
	taptempo = 0 // Tempo in measuring
	tapping = 0 // Is tapping?
	ltime = 0 // Last time tapped
	taps = 0 // Times tapped
	tapdouble = 0 // Set to double tempo?
	percentvel = 0
	addpitch = 0
	dropmode = 0
	dropalpha = 1
	dropalphawait = 0
	draw_set_circle_precision(64);

	// Midi export / import
	w_midi_remember = 1
	w_midi_removesilent = 1
	w_midi_name = 1
	w_midi_name_patch = 1
	w_midi_tab = 0
	w_midi_maxheight = 20
	w_midi_tempo = 1
	w_midi_octave = 0
	w_midi_vel = 1
	w_midi_precision = 1
	w_midi_tempo_changer = 0
	w_isdragging = 0
	w_dragvalue = 0
	init_midi()
	
	// Minecraft
	selected_tab_mc = 0

	// Schematic
	reset_schematic_export(0)
	block_color = 0
	structure = 0
	command_block = 0

	//Datapack
	dat_reset(0)

	//Audio export
	audio_exp_format = "MP3"
	audio_exp_sample_rate = 44100
	audio_exp_channels = 2
	audio_exp_include_locked = 0
	audio_exp_target_bitrate = 320

	// Macros
	stereo_reverse = 0
	tremolotype = 0
	trem_spacing = 1
	fade_auto = 1
	leg_dec = 20
	leg_sus = 20
	port_cent = 0
	porta_reverse = 0
	stereo_width = 50
	setvel = 100
	setpan = 0
	setpit = 0

	// Saving
	save_version = nbs_version

	// Settings
	if (!check_args("--prefreset")) load_settings()
	switch(language) {
		default:
			lang_en_us()
	}
	if (channelstoggle) channels = 32768
	else channels = 256
	audio_channel_num(channels)
	change_theme()
	if (show_welcome) window = w_greeting
	draw_accent_init()
	if (isplayer) window_set_size(floor(800 * window_scale), floor(500 * window_scale))
	window_set_min_width(800 * window_scale)
	window_set_min_height(500 * window_scale)
	if ((theme = 3 && fdark) || theme = 2) window_set_darkmode()
	if (keynames_flat) keynames = ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"]
	
	if (current_resource != "Vanilla") {
		set_resourcepack(current_resource)
	}

	// Updates
	if (check_update)
		if (check_prerelease) {
			update_http = http_get(link_releases)
		} else {
			update_http = http_get(link_latest)
		}
	else
	    update_http = -1
	update_download = -1
	downloaded_size = 0
	total_size = -1
	changelogstr = load_text(data_directory + "changelog.txt")
	creditsstr = load_text(data_directory + "credits.txt")
	if (file_exists_lib(settings_file) && vers != version) {
		if (theme = 2) fdark = 1
		theme = 3 // Sets to the Fluent theme when updated
	    window = w_update
	    update_success = 1
	}

	// Delete old installer
	if (file_exists_lib(update_file)) {
		files_delete_lib(update_file)
	}
	
	// Init wallpaper
	change_theme()

	// Auto-recovery
	// PREVIOUSLY DISABLED DUE TO https://github.com/OpenNBS/OpenNoteBlockStudio/issues/196
	// Implemented in a better way that takes multiple instances into account.
	if (!port_taken && !isplayer) {
		if (file_find_first(backup_file + "*_backup.nbs", 0) != "") {
			if (question("Minecraft Note Block Studio quit unexpectedly while you were working on a song. Do you want to recover your work?", "Auto-recovery")) {
				open_url(backup_file)
			}
		} else if (file_find_first(backup_file + "*_unsaved.nbs", 0) != "") {
			if (question("Minecraft Note Block Studio detected you closed the window without saving the song in the last session. Do you want to recover your work?", "Auto-recovery")) {
				open_url(backup_file)
			}
		}
	}

	// Open song
	if (parameter_count() > 0) {
		songs[song].filename = filenamearg
		if (songs[song].filename != "" && (filename_ext(songs[song].filename) = ".mid" || filename_ext(songs[song].filename) = ".midi" || filename_ext(songs[song].filename) = ".schematic" || filename_ext(songs[song].filename) = ".nbs")) {
			if (!port_taken) {
				load_song(songs[song].filename, 0, 1, 1)
			}
		}
		else songs[song].filename = ""
	}

	log("Startup OK")
	
	}


}
