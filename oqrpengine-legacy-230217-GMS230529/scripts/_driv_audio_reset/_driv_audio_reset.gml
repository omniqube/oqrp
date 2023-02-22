function _driv_audio_reset(){
	instance_destroy(d_sound_api);
	instance_create_depth(0, 0, 0, d_sound_api); 
}