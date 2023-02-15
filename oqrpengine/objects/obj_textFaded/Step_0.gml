/// @description Insert description here
// You can write your code in this editor
if(alpha > 0 and state = 0){
	alpha--;
	if(alpha = 0){
		state = 1;
	}
}else{
	alpha++;	
	if(alpha = 255){
		state = 0;
	}
}