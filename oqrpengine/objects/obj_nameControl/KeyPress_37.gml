/// @description Insert description here
// You can write your code in this editor
if choice = 1{
	if(choiceyes = 0){
	choiceyes = 1	
	}else{
	choiceyes = 0	
	}
	
}else{
if(currentrow > 0){
currentrow = currentrow - 1
}else{
if(currentline > 0){
currentline = currentline - 1
currentrow = 0;
while(nameData[currentline,currentrow+1] != 0){
currentrow = currentrow + 1
}
}else{
//do nothing	
}
}
}