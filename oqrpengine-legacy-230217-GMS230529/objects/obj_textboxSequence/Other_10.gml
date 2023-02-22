tbstep++;
maxbox = array_length(box);

textbox_make {
	
	layout = obj_textboxSequence.box[obj_textboxSequence.tbstep].layout
	font = obj_textboxSequence.box[obj_textboxSequence.tbstep].font
	snd = obj_textboxSequence.box[obj_textboxSequence.tbstep].snd
	text = obj_textboxSequence.box[obj_textboxSequence.tbstep].text
	
} textbox_show

returnPulse = false;