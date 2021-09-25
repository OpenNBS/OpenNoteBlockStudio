#macro DISCORD_APP_ID "848873736702132246"

ready = false;
if (!np_initdiscord(DISCORD_APP_ID, true, 0) && obj_controller.presence)
{
	log("NekoPresence initializing failed. Do you have Discord installed?")
}