/// @description Insert description here
// You can write your code in this editor
sprite_index = obj_introControl.panelSprite[obj_introPanel.current]
if(obj_introControl.panelMoving[obj_introPanel.current] = 1){
	y = y + obj_introControl.panelMovingSpeed[obj_introPanel.current];
}
else if(obj_introControl.panelMoving[obj_introPanel.current] = -1){
	x = x + obj_introControl.panelMovingSpeed[obj_introPanel.current];
}else{
x = 60
y = 28
}