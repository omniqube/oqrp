/// @description Insert description here
// You can write your code in this editor
if(doonce < 1){
instance_create_layer(basex+offset,basey+offset,"GUI",obj_guiMover)
log("Creating child guiMover in x: " + string(basex+offset) + " ,y : " + string(basey+offset));
doonce = 1	
}
draw_set_circle_precision(432);
draw_circle(basex+offset,basey+offset,offset,true);