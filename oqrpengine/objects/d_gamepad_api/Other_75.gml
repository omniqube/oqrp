switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
case "gamepad discovered":                     
    var pad = async_load[? "pad_index"];       
    gamepad_set_axis_deadzone(pad, _default_deadzone);       
    gamepad_set_button_threshold(pad, _default_threshold);    
	global.oqrp_gp[0] = true;
	global.oqrp_gpmain = pad;
    break;
case "gamepad lost":                           
    var pad = async_load[? "pad_index"];       
	global.oqrp_gp[0] = false;
    break;
}