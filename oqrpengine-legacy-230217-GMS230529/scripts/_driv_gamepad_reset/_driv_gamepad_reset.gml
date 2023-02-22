function _driv_gamepad_reset(){
	instance_destroy(d_gamepad_api);
	instance_create_depth(0, 0, 0, d_gamepad_api); 
}