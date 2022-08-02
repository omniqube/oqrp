// General Macro File

#region Extended GML Syntax and Operators
#macro elif else if
#macro ignore if (true) {} else
#macro defer for (;; { 
#macro after ; break; })

#macro log show_debug_message

// Advanced logic
#macro implies ^^ true ||  // Implication, a (->) b
#macro bimplies ^ (~0) |   // Bitwise Implication

#macro seq == NaN) && false ? undefined : ( // Sequential Composition

#endregion


#macro echo show_console_message
#macro sudo runCommand

#macro _nxtprint                      \
    for (var printValue;; {           \
      show_debug_message(printValue); \
      break;                          \
    }) printValue =




#region Textbox Macros
#macro textbox_show with(obj_textbox){event_user(0);};
#macro textbox_make instance_create_depth(0,0,0,obj_textbox); with(obj_textbox)
#macro textbox_show_choice with(obj_textboxChoice){event_user(0);};
#macro textbox_make_choice instance_create_depth(0,0,0,obj_textboxChoice); with(obj_textbox)

#macro textbox_sequence_init function tb_create_event()
#macro textbox_sequence_make instance_create_depth(0,0,0,obj_textboxSequence); with(obj_textboxSequence)
#macro textbox_sequence_show with(obj_textboxSequence){event_user(0);};
#endregion
