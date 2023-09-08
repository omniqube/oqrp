/// @desc OQRP Engine

/*
                                                                                                                
 ██████╗  ██████╗ ██████╗ ██████╗     ███████╗███╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
██╔═══██╗██╔═══██╗██╔══██╗██╔══██╗    ██╔════╝████╗  ██║██╔════╝ ██║████╗  ██║██╔════╝
██║   ██║██║   ██║██████╔╝██████╔╝    █████╗  ██╔██╗ ██║██║  ███╗██║██╔██╗ ██║█████╗  
██║   ██║██║▄▄ ██║██╔══██╗██╔═══╝     ██╔══╝  ██║╚██╗██║██║   ██║██║██║╚██╗██║██╔══╝  
╚██████╔╝╚██████╔╝██║  ██║██║         ███████╗██║ ╚████║╚██████╔╝██║██║ ╚████║███████╗
 ╚═════╝  ╚══▀▀═╝ ╚═╝  ╚═╝╚═╝         ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
                                                                                                                                                                                                                                 
								OQRP Engine
							Developed by OmniQube
							©2021-2023 OmniQube
		   
*/

// See the licenses note before use.
// https://omniqube.github.io/

#region preinit
gml_pragma("global", "oqrp_configmap()"); // YYC Compiler @startup
global.nodebug_dev = true;
global.fullscreen = false;
#endregion

#region Load Engine Configuration
randomize();

window_set_caption(global.oqrp.game.name);
game_set_speed(60, gamespeed_fps);
global.realtime = 60;

if (debug_mode || global.nodebug_dev) {
global.consoleEnabled = true;
global.consoleActive = false;
global.enableExperimentalFeatures = true;
global.developerMode = true;
global.introEnabled = false;
} else {
global.consoleEnabled = false;
global.consoleActive = false;
global.enableExperimentalFeatures = false;
global.developerMode = false;
global.introEnabled = true;
}
if (code_is_compiled()) {}
#endregion
#region Catch Command Line Arguments
// CATCH COMMAND LINE ARGUMENTS
var p_num;
p_num = parameter_count();
if p_num > 0 {var i;
	for (i = 0; i < p_num; i += 1){p_string[i] = parameter_string(i + 1);}}

/* FULL LIST OF ARGUMENTS INCLUDING BUILT IN GMS ARGUMENTS

-noaudio: This switches off all audio.
-inawindow: Forces the game to start in a window.
-output <filename>: Sends console output to the filename, including any debug messages.
-debugoutput <filename>: Sends console output to the filename, excluding any custom debug messages, but including extra information from the runner for bug reporting.
-software: Will force the game to use Software Vertex Processing instead of hardware for rendering the game graphics. This is especially useful for those PCs that are using an on-board Intel GFX chipset or show display issues on older machines.
-intel: This will switch on a fix for bad Intel drivers, no matter what GPU is being used. This work around for those bad drivers will slow things down, giving a noticeable performance hit.
-vanillaGFX: Using this switches off any check for driver manufacturer.

-devmode: Enables compiled developer mode.
-console: Enables the console.
-novideo: Skips the intro video, if applicable.
-forcefs: Forces the game to run in fullscreen.
-experimental: Enables experimental features.
-resetbinds: Resets all in-game binds to the default setting.

*/

for (i = 0; i < array_length(p_string); i++) {
	switch (p_string[i]) {
		case "-devmode": global.developerMode = true;
		case "-console": global.consoleEnabled = true;
		case "-novideo": global.introEnabled = false;
		case "-forcefs": global.fullscreen = true; window_set_fullscreen(global.fullscreen);
		case "-experimental": global.enableExperimentalFeatures = true;
		case "-resetbinds": resetbinds();
		default: break;
	}
}
#endregion

initbinds();

#region Start Engine Drivers
instance_create_depth(0, 0, 0, d_sound_api); 
instance_create_depth(0, 0, 0, d_gamepad_api); 
instance_create_depth(0, 0, 0, d_display_api);
instance_create_depth(0, 0, 0, d_network_api);
instance_create_depth(0, 0, 0, d_gj_api);
#endregion

EngineObjectList();

alarm[0] = 1
alarm[1] = 2
alarm[3] = 1

#region Map Game and Engine Resources
global.oqrp_res = {fonts: ds_map_create(), objects: ds_map_create(), paths: ds_map_create(), 
sounds: ds_map_create(), rooms: ds_map_create(), sprites: ds_map_create(),
timelines: ds_map_create()} 

map_fonts(global.oqrp_res.fonts); map_objects(global.oqrp_res.objects);
map_paths(global.oqrp_res.paths); map_sounds(global.oqrp_res.sounds);
map_rooms(global.oqrp_res.rooms); map_sprites(global.oqrp_res.sprites);
map_timelines(global.oqrp_res.timelines);
#endregion

#region Auxilliary Functions (Filesystem)
sv_init();
if global.oqrp.game.allow_mods modScan();
#endregion

LoadScript("EN");

engdraw = false;

