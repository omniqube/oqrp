// Textbox Macros

#macro textbox_show with(obj_textbox){event_user(0);};
#macro textbox_make instance_create_depth(0,0,0,obj_textbox); with(obj_textbox)

#macro textbox_sequence_make instance_create_depth(0,0,0,obj_textboxSequence); with(obj_textboxSequence)
#macro textbox_sequence_show with(obj_textboxSequence){event_user(0);};