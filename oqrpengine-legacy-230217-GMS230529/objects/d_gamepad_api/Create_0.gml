// OQRP Gamepad Driver, rewritten for multi-platform and DirectInput support

if (!gamepad_is_supported()) {instance_destroy();}
//instance_destroy();

/*gp_num = gamepad_get_device_count();
global.oqrp_gp = array_create(gp_num);

for (var i = 0; i < gp_num; i++;){
	if gamepad_is_connected(i) global.oqrp_gp[i] = true else global.oqrp_gp[i] = false;}
	
global.oqrp_gpmain = -1
for (i = 0; i < array_length(global.oqrp_gp); i++) {


if (global.oqrp_gp[i]) {

global.oqrp_gpmain = i;
gpmain_GUID = gamepad_get_guid(i)
gpmain_desc = gamepad_get_description(i)

} else {}}*/

_default_deadzone = 0.5;
_default_threshold = 0.1;

function a_vibrate(sec, l, r) {
	l /= 100; r /= 100;
	alarm[0] = room_speed * sec
	gamepad_set_vibration(global.oqrp_gpmain, l, r)
}