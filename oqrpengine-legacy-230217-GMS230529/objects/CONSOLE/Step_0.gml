if (input("console")) {
	
	global.consoleActive = !global.consoleActive; keyboard_string = "";
	
	if (global.consoleActive == true) {lockGameInput()} else {unlockGameInput()}
	
	}


if (global.consoleActive) {
	
	if (input("pause")) {global.consoleActive = false} else {

userInput = string_replace_all(keyboard_string, "#", "\#");
  if (keyboard_check_pressed(vk_enter))
  {
	push(userInput);
    commandString = userInput;
    runCommand(userInput);
	
    clearUserInput();
  }
  
  function clearUserInput() {
	keyboard_string = "";
	userInput = "";
	commandResult = "";
  }
 

}}

if ds_list_size(commandhistory) >= maxCommands {pop()}
