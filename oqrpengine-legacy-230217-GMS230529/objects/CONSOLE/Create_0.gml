userInput = "";
commandString = "";
commandResult = "";
  
commandhistory = ds_list_create();
ds_list_add(commandhistory, "Console Ready.")
maxCommands = 30;

  startX = x;
  startY = y-20;
  lineHeight = 30 //string_height("X")
  
function print(str) {push(str)}
function push(data) {if (data == "") {} else {ds_list_insert(commandhistory, 0, data)}}
function pop() {ds_list_delete(commandhistory, ds_list_size(commandhistory)-1)}