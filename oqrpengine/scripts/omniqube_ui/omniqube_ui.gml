/// OmniQube UI for the OQRP Engine


///@func AppSurfaceCapture()
///@desc Returns a generated sprite by capturing the Application Surface.
///@returns {Asset.GMSprite}
///@pure
function AppSurfaceCapture() {
	return sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
}



#region Pause

function PauseScreen() {
	
	draw_sprite_ext(backgroundSprite, 0, 0, 0, 1, 1, 0, 0, 0.5)
	draw_set_font(fontCourierNew);
	draw_text_transformed(200, 200, "PAUSED", 3, 3, 0);
	
}


#endregion

#region Main UI

///@func stime_formatted(number)
///@desc Returns a draw-ready string of the current hour/minute/second with a "0" applied to it if it is less than 10.
///@param {Integer} number The hour/minute/second to format.
///@returns {String} A string of the formatted time value.
///@pure
function stime_formatted(number) {
	if (number < 10) {
		return "0" + string(number);
	} else {
		return string(number);	
	}
}

function DrawUIBase() {
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_set_font(FontArialUI);
	draw_text_transformed(window_get_width()/10, window_get_height()/12, stime_formatted(current_hour) + ":" + stime_formatted(current_minute) + ":" + stime_formatted(current_second), 3, 3, 0);
	draw_text_transformed(window_get_width()/2, window_get_height()/12, global.oqrp.game.name, 2, 2, 0);
}

#endregion

#region Popups

///@func ui_PushPopup(class, msg, icon)
///@desc Push a popup message to the OQUI.
///@param {String} class Class of the popup (type).
///@param {String} msg Message displayed on the popup.
///@param {Asset.GMSprite} icon (Optional) Icon displayed on the popup.
function ui_PushPopup(class, msg, icon) {
	
	_popup = ds_map_create();
	ds_map_add(_popup, "class", class);
	ds_map_add(_popup, "message", msg);
	
	switch (class) {
		case "messageIcon": ds_map_add(_popup, "icon", icon); break;
		case "achievementIcon": ds_map_add(_popup, "icon", icon); break;
		case "achievementProgressIcon": ds_map_add(_popup, "icon", icon) break;
	}
	
	ds_list_add_map(oqui.popups, _popup);
}

function drawPopup() { // STRICTLY ONLY THROUGH OQUI CONTEXT, CALLED ONCE PER FRAME
	
	// Move anim_popup with gain()
	if (anim_popup < anim_popup_duration_move) {anim_popup+=1+5*gain(0.3, normalize(anim_popup, 0, anim_popup_duration_move, 1, 0));}
	if (anim_popup > anim_popup_duration_move && anim_popup < anim_popup_duration_move+anim_popup_duration_stay) {anim_popup++;}
	if (anim_popup > anim_popup_duration_move+anim_popup_duration_stay && anim_popup < (anim_popup_duration_move*2)+anim_popup_duration_stay) {anim_popup+=1+5*gain(0.3, normalize(anim_popup, anim_popup_duration_stay+anim_popup_duration_move, (anim_popup_duration_move*2)+anim_popup_duration_stay, 0, 1));}
	
	_win_w = window_get_width();
	_win_h = window_get_height();
	_size_w = (_win_w/4);
	_size_h = (_win_h/6);
	_ypos_tr = normalize(anim_popup, 0, anim_popup_duration_move, 0, _size_h)-_size_h;
	_ypos_bl = normalize(anim_popup, 0, anim_popup_duration_move, 0, _size_h);
	
	_title = "";
	if (ds_map_find_value(_currentpopup, "class") == "messageIcon" || ds_map_find_value(_currentpopup, "class") == "achievementIcon" || ds_map_find_value(_currentpopup, "class") == "errorIcon") {_icon = ds_map_find_value(_currentpopup, "icon");}
	if (ds_map_find_value(_currentpopup, "class") == "achievement" || ds_map_find_value(_currentpopup, "class") == "achievementIcon" || ds_map_find_value(_currentpopup, "class") == "achievementProgress" || ds_map_find_value(_currentpopup, "class") == "achievementProgressIcon") {_title = "Achievement Unlocked!"}
	
	_content = ds_map_find_value(_currentpopup, "message");
	
	draw_set_color(c_dkgray);
	if (anim_popup > anim_popup_duration_move && anim_popup > anim_popup_duration_move+anim_popup_duration_stay) {
		_ypos_tr = normalize(anim_popup, anim_popup_duration_move+anim_popup_duration_stay, (anim_popup_duration_move*2)+anim_popup_duration_stay, _size_h, 0)-_size_h;
		_ypos_bl = normalize(anim_popup, anim_popup_duration_move+anim_popup_duration_stay, (anim_popup_duration_move*2)+anim_popup_duration_stay, _size_h, 0);
		draw_rectangle(0,_ypos_tr,_size_w,_ypos_bl,false);
		popupContent(false);
	} elif (anim_popup > anim_popup_duration_move) {
		draw_rectangle(0,0,_size_w,_size_h,false);
		popupContent(true);
	} else {
		draw_rectangle(0,_ypos_tr,_size_w,_ypos_bl,false);
		popupContent(false);
	}
	
	
}

function popupTitle(stay) {
	draw_set_halign(fa_center);
	draw_set_font(FontArialUI);
	draw_set_color(c_white); 
	_title_ypos = _ypos_bl-_size_h+(_size_h/12);
	if (stay) {_title_ypos = (_size_h/9);}
	if (ds_map_find_value(_currentpopup, "class") == "achievement" || ds_map_find_value(_currentpopup, "class") == "achievementIcon" || ds_map_find_value(_currentpopup, "class") == "achievementProgress" || ds_map_find_value(_currentpopup, "class") == "achievementProgressIcon") draw_text_transformed(_size_w/2, _title_ypos, _title, (_size_w/220), (_size_w/220), 0);
}

function popupContent(stay) {
	popupTitle(stay);
	if (ds_map_find_value(_currentpopup, "class") == "messageIcon" || ds_map_find_value(_currentpopup, "class") == "achievementIcon" || ds_map_find_value(_currentpopup, "class") == "errorIcon") {
		_content_ypos = _size_h/2
		_content_xpos = _size_w/2 + _size_w/8
		_icon_xpos = _size_w/12
		_icon_ypos = _size_h/3
		if (not stay) {_content_ypos+=_ypos_tr; _icon_ypos+=_ypos_tr;}
		draw_sprite_ext(_icon, 0, _icon_xpos, _icon_ypos, 1, 1, 0, c_white, 1);
	} else {
		_content_ypos = _size_h/2
		_content_xpos = _size_w/2
		if (not stay) {_content_ypos+=_ypos_tr;}
	}
	
	draw_text_transformed(_content_xpos, _content_ypos, "\"" + _content + "\"", (_size_w/250), (_size_w/250), 0);
	draw_set_color(c_ltgray);
	draw_text_transformed(_size_w/2,_content_ypos+(_size_h/3), "[Tab] to view", (_size_w/300), (_size_w/300), 0);
}

#endregion