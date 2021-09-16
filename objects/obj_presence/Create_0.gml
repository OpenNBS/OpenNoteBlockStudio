#macro DISCORD_APP_ID "848873736702132246"

ready = false;
if (!np_initdiscord(DISCORD_APP_ID, true, 0) && obj_controller.presence)
{
	if (obj_controller.language != 1) show_error("NekoPresence initializing failed. Do you have Discord installed?", false);
	else show_error("NekoPresence初始化失败。如不使用Discord可在首选项内关闭该功能。", false);
}