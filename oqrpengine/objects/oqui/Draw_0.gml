if (pauseActive && (backgroundSprite != -1)) {
	PauseScreen();
}

if (!pauseActive && !uiActive && ds_list_size(popups) > 0 && anim_popup == 0) {
	
	_currentpopup = ds_list_find_value(popups, 0);
	ds_list_delete(popups, 0);
	for (i = 1; i < ds_list_size(popups); i++) {
		ds_list_replace(popups, i-1, ds_list_find_value(popups, i));
	}
	
	switch (ds_map_find_value(_currentpopup, "class")) {
		
		case "message": audio_play_sound(oqui_popup, 0, false); break;
		case "achievement": audio_play_sound(oqui_achievement, 0, false); break;
		case "messageIcon": audio_play_sound(oqui_popup, 0, false); break;
		case "achievementIcon": audio_play_sound(oqui_achievement, 0, false); break;
		case "error": audio_play_sound(oqui_popup, 0, false); break;
		case "errorIcon": audio_play_sound(oqui_popup, 0, false); break;
		default: return;
		
	}
	drawPopup();
	
}

if (anim_popup > (anim_popup_duration_move*2)+anim_popup_duration_stay) {anim_popup = 0;}

if (!pauseActive && !uiActive && anim_popup > 0) {drawPopup();}
