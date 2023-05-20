/// @description Insert description here
// You can write your code in this editor
parentid = 0;
for(i = 0; i < instance_number(obj_guiController); i++){
	tempid = instance_find(obj_guiController,i);
	log("joystick: " + string(x) + " , " + string(y) + " \\ radius: " + string(tempid.x) + " , " + string(tempid.y) + " offset: " + string(tempid.offset));
	if(abs(tempid.x - x) < 720){
		log("GOT HERE");
		parentid = tempid	
	}
	if(parentid != 0){
	 i = instance_number(obj_guiController);	
	}
	
}
log("TEMPID: " + string(tempid));
basex = parentid.basex;
basey = parentid.basey;
device = -1;
