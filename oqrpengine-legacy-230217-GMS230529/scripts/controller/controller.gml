function controller_check(button) {
	return gamepad_button_check(global.oqrp_gpmain, button);
}

function controller_check_pressed(button) {
	return gamepad_button_check_pressed(global.oqrp_gpmain, button);
}

function gpaxistest(request) {
	if (string_contains(request, "up") && gamepad_axis_value(global.oqrp_gpmain, gp_axislv) < -0.5) {return true}
	if (string_contains(request, "down") && gamepad_axis_value(global.oqrp_gpmain, gp_axislv) > 0.5) {return true}
	if (string_contains(request, "right") && gamepad_axis_value(global.oqrp_gpmain, gp_axislh) > 0.5) {return true}
	if (string_contains(request, "left") && gamepad_axis_value(global.oqrp_gpmain, gp_axislh) < -0.5) {return true}
	
	return false;
}