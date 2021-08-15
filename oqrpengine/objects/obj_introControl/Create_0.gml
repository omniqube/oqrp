/// @description Insert description here
// You can write your code in this editor
//SETUP VARS
maxPanels = 3;
font = fontCourierNew;
panelText[maxPanels] = "";
panelSprite[maxPanels] = 0; 
panelMoving[maxPanels] = 0; //1 is vertical, -1 is horizontal
panelMovingSpeed[maxPanels] = 0;
paneltextSpeed[maxPanels] = 0; 
instance_create_depth(0,0,-2,obj_introPanel)