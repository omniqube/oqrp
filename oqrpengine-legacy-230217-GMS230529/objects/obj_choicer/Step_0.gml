/// @description Insert description here
// You can write your code in this editor
obj_textboxBox.currentchoice = current
if(input("move_left")){
if current > 0{
current--;
if(current = 1 or current = 3){
x = x -	154
}else{
y = y - 32
}
}
}
if (input("move_right")){
if current < obj_textboxBox.choices-1{
current++;
if(current = 0 or current = 2){
x = x + 154;	
}else{
y = y + 32	
}
}
}
if input("move_up"){
if current > 1{
current = current - 2;
y = y - 32
}
}
if input("move_down"){
if current <= obj_textboxBox.choices-2{	
current = current + 2;
y = y + 32
}
}