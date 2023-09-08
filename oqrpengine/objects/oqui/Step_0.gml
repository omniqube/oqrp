if input("pause") {
	pauseActive = !pauseActive;
	
	if (pauseActive) {
		backgroundSprite = AppSurfaceCapture();
		instance_deactivate_game();
	
	} else {
		instance_activate_all();
		backgroundSprite = -1;
		
	}
}

if keyboard_check_released(vk_tab) && not anim_wait {
		uiActive = !uiActive;
if (uiActive) {
	backgroundSprite = AppSurfaceCapture();
	anim_backblur = 0;

	instance_deactivate_game();
application_surface_draw_enable(false);
audio_play_sound(oqui_open, 0, false);
} else {
	anim_wait = true;
	//audio_play_sound(oqui_close, 0, false); trim first
}
}

if (anim_backblur == 0 && anim_wait) {
	anim_wait = false;
application_surface_draw_enable(true);
instance_activate_all();
}
