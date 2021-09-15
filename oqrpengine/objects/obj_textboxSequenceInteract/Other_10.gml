/*
textbox_make {
	layout = "Classic"
	font = UTfont
	snd = snd_introtext
	text[0] = "Testing testing T E S T I N G"
	text[1] = "Testing 2 \nTesting 2"
	text[2] = "Testing 3 |||||.|||||.|||||."
} textbox_show
*/


textbox_sequence_make {
	
	box[0] = {
		layout : "Classic",
		font : UTfont,
		snd : snd_introtext,
		text : [
		"Testing textbox 1", 
		"Testing 2 \nTesting 2", 
		"Testing 3 |||||.|||||.|||||."
		]
	}
	
	box[1] = {
		layout : "Classic",
		font : UTfont,
		snd : snd_introtext,
		text : [
		"Testing textbox 2", 
		"Testing 2 \nTesting 2", 
		"Testing 3 |||||.|||||.|||||."
		]
	}
	
} textbox_sequence_show
