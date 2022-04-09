function draw_text_hud() {
    var xoffset,yoffset,tx,ty;
 
    xoffset = argument0;
    yoffset = argument1;
 
    tx = view_xview[0] + view_wview[0]/2 + lengthdir_x(xoffset-view_wview[0]/2,-view_angle[0]) 
        + lengthdir_x(yoffset-view_hview[0]/2,-view_angle[0]-90);
    ty = view_yview[0] + view_hview[0]/2 + lengthdir_y(xoffset-view_wview[0]/2,-view_angle[0]) 
        + lengthdir_y(yoffset-view_hview[0]/2,-view_angle[0]-90);
 
    draw_text_ext_transformed_color(tx,ty,argument2,argument3,argument4,argument5,argument6,
    argument7-view_angle[0],argument8,argument9,argument10,argument11,argument12);
    return 0;
}

function draw_text_shadow() {
    var c,a,i,j;
    c = draw_get_color();
    a = draw_get_alpha();
    i = lengthdir_x(argument6, argument7);
    j = lengthdir_y(argument6, argument7);
    draw_set_color(argument4);
    draw_set_alpha(a * argument5);
    draw_text_ext(argument0 + i, argument1 + j, argument2, -1, -1);
    draw_set_color(argument3);
    draw_set_alpha(a);
    draw_text_ext(argument0, argument1, argument2, -1, -1);
    draw_set_color(c);
    return 0;
}

function string_limit_width() { // String pixel width
    var str,ext,wid;
    str = argument0;
    ext = argument2;
    wid = max(argument1, string_width(ext));
    if (string_width(str) <= wid) return str;
    while (string_width(str + ext) > wid) {
        str = string_delete(str, string_length(str), 1);
    } 
    return str + ext;
}

function string_wordwrap_width() { // String pixel width with word wrap
    var pos_space, pos_current, text_current, text_output;
    pos_space = -1;
    pos_current = 1;
    text_current = argument0;
    if (is_real(argument2)) argument2 = "#";
    text_output = "";
    while (string_length(text_current) >= pos_current) {
        if (string_width(string_copy(text_current,1,pos_current)) > argument1) {
            //if there is a space in this line then we can break there
            if (pos_space != -1) {
                text_output += string_copy(text_current,1,pos_space) + string(argument2);
                //remove the text we just looked at from the current text string
                text_current = string_copy(text_current,pos_space+1,string_length(text_current)-(pos_space));
                pos_current = 1;
                pos_space = -1;
            } else if (argument3) {
                //if not, we can force line breaks
                text_output += string_copy(text_current,1,pos_current-1) + string(argument2);
                //remove the text we just looked at from the current text string
                text_current = string_copy(text_current,pos_current,string_length(text_current)-(pos_current-1));
                pos_current = 1;
                pos_space = -1;
            }
        }
        pos_current += 1;
        if (string_char_at(text_current,pos_current) == " ") pos_space = pos_current;
    }
    if (string_length(text_current) > 0) text_output += text_current;
    return text_output;
}