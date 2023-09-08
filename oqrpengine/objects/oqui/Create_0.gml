///@desc OmniQube UI for the OQRP Engine
// A universal platform for displaying popups, messages and asynchronous data in-game.

uiActive = false;
pauseActive = false;
backgroundSprite = -1;
uiClass = ""; // main, popup, message

///@func instance_deactivate_game()
///@desc Deactivates every instance in the game except for critical engine components from EngineObjectList.
function instance_deactivate_game() {
	instance_deactivate_all(true);
	for (i = 0; i < array_length(global.EngineObjects); i++) {
		//if (instance_exists(global.EngineObjects[i])) {
			instance_activate_object(global.EngineObjects[i]);
		//}	
	}
}

anim_backblur = 0;
anim_backblur_duration = global.realtime*0.3;
anim_popup = 0;
anim_popup_duration_move = global.realtime*2;
anim_popup_duration_stay = global.realtime*2;
anim_wait = false;

blur_init();

popups = ds_list_create();