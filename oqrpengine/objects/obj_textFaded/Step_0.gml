/// @description Insert description here
// You can write your code in this editor
if(alpha > 0.1 and state = 0){
	alpha -= 0.02;
	if(alpha = 0.1){
		state = 1;
	}
}else{
	alpha += 0.02;	
	if(alpha = 1){
		state = 0;
	}
}