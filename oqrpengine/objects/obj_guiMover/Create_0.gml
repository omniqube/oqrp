/// @description Insert description here
// You can write your code in this editor
parentid = 0;
for(i = 0; i < instance_number(obj_guiController)-1; i++){
	tempid = instance_find(obj_guiController,i);
	if(x >= tempid.x && x <= tempid.x + tempid.offset * 2 && y >= tempid.y && y <= tempid.y + tempid.offset*2){
		parentid = tempid	
	}
	if(parentid != 0){
	 i = instance_number(obj_guiController);	
	}
	
}
basex = parentid.basex;
basey = parentid.basey;
device = -1;