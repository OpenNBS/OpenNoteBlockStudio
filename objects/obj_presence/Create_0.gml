#macro DISCORD_APP_ID "848873736702132246"

ready = false;
if (!np_initdiscord(DISCORD_APP_ID, true, 0))
{
	show_error("NekoPresence init fail.", true);
}