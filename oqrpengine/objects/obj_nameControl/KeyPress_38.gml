/// @description Insert description here
// You can write your code in this editor
if choice = 1{
	
	
}else{
if(currentline < 8 && currentline > 0){
currentline = currentline - 1
if(nameData[currentline,currentrow] = 0){
currentrow = 0;
while(nameData[currentline,currentrow+1] != 0){
currentrow = currentrow + 1
}	
}
}
if(currentline = 8){
switch(currentrow){
case 0: break;	
case 1: currentrow = 2; break;
case 2: currentrow = 4; break;
}
currentline = currentline - 1
}
}