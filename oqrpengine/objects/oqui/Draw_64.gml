if (uiActive) {
	if (anim_backblur < anim_backblur_duration) {anim_backblur++; anim_wait = true;} else {anim_wait = false;}
	
	var _tex = sprite_get_texture(backgroundSprite, 0);
	blur_set(_tex,normalize(anim_backblur, 0, anim_backblur_duration, 0, 16));
	draw_sprite_ext(backgroundSprite, 0, 0, 0, 1, 1, 0, c_white, normalize(anim_backblur, 0, anim_backblur_duration, 1, 0.5));
	blur_reset();
	
	if (not anim_wait) { 
	DrawUIBase();
	
	}
	
} else {
	if (anim_backblur > 0) {anim_backblur--;
	var _tex = sprite_get_texture(backgroundSprite, 0);
	blur_set(_tex,normalize(anim_backblur, 0, anim_backblur_duration, 0, 16));
	draw_sprite_ext(backgroundSprite, 0, 0, 0, 1, 1, 0, c_white, normalize(anim_backblur, 0, anim_backblur_duration, 1, 0.5));
	blur_reset();
	
	}
}

