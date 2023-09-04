function draw_arc() {
    var x1,y1,x2,y2,x3,y3,x4,y4,precision;
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    x3 = argument4;
    y3 = argument5;
    x4 = argument6;
    y4 = argument7;
    precision = argument8;
    if (precision == 0) precision = 24;
    var res,xm,ym,xr,yr,r,a1,a2,sx,sy,a;
    res = 360 / min(max(4,4*(precision div 4)),64);
    xm = (x1+x2)/2;
    ym = (y1+y2)/2;
    xr = abs(x2-x1)/2;
    yr = abs(y2-y1)/2;
    if (xr > 0) r = yr/xr;
    else r = 0;
    a1 = point_direction(0,0,(x3-xm)*r,y3-ym);
    a2 = point_direction(0,0,(x4-xm)*r,y4-ym);
    if (a2<a1) a2 += 360;
    draw_primitive_begin(pr_linestrip);
    sx = xm+lengthdir_x(xr,a1);
    sy = ym+lengthdir_y(yr,a1);
    draw_vertex(sx,sy);
    for (a=res*(a1 div res + 1); a<a2; a+=res) {
        sx = xm+lengthdir_x(xr,a);
        sy = ym+lengthdir_y(yr,a);
        draw_vertex(sx,sy);
    }
    sx = xm+lengthdir_x(xr,a2);
    sy = ym+lengthdir_y(yr,a2);
    draw_vertex(sx,sy);
    draw_primitive_end();
    return 0;
}

function draw_chord() {
    var x1,y1,x2,y2,x3,y3,x4,y4,outline,precision;
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    x3 = argument4;
    y3 = argument5;
    x4 = argument6;
    y4 = argument7;
    outline = argument8;
    precision = argument9;
    if (precision == 0) precision = 24;
    var res,xm,ym,xr,yr,r,a1,a2,sx,sy,a;
    res = 360 / min(max(4,4*(precision div 4)),64);
    xm = (x1+x2)/2;
    ym = (y1+y2)/2;
    xr = abs(x2-x1)/2;
    yr = abs(y2-y1)/2;
    if (xr > 0) r = yr/xr;
    else r = 0;
    a1 = point_direction(0,0,(x3-xm)*r,y3-ym);
    a2 = point_direction(0,0,(x4-xm)*r,y4-ym);
    if (a2<a1) a2 += 360;
    if (outline) draw_primitive_begin(pr_linestrip);
    else draw_primitive_begin(pr_trianglefan);
    sx = xm+lengthdir_x(xr,a1);
    sy = ym+lengthdir_y(yr,a1);
    draw_vertex(sx,sy);
    for (a=res*(a1 div res + 1); a<a2; a+=res) {
        sx = xm+lengthdir_x(xr,a);
        sy = ym+lengthdir_y(yr,a);
        draw_vertex(sx,sy);
    }
    sx = xm+lengthdir_x(xr,a2);
    sy = ym+lengthdir_y(yr,a2);
    draw_vertex(sx,sy);
    if (outline) {
        sx = xm+lengthdir_x(xr,a1);
        sy = ym+lengthdir_y(yr,a1);
        draw_vertex(sx,sy);
    }
    draw_primitive_end();
    return 0;
}

function draw_crosshair() {
    draw_line(0,argument1,room_width,argument1);
    draw_line(argument0,0,argument0,room_height);
    return 0;
}

function draw_crosshair_ext() {
    draw_line_color(0,argument1,room_width,argument1,argument2,argument3);
    draw_line_color(argument0,0,argument0,room_height,argument4,argument5);
    return 0;
}

function draw_crosshair_width() {
    draw_line_width(0,argument1,room_width,argument1,argument2);
    draw_line_width(argument0,0,argument0,room_height,argument2);   
    return 0;
}

function draw_crosshair_width_ext() {
    draw_line_width_color(0,argument1,room_width,argument1,argument2,argument3,argument4);
    draw_line_width_color(argument0,0,argument0,room_height,argument2,argument5,argument6);
    return 0;
}

function draw_curve() {
    var x1, y1, x2, y2, start_angle, detail, dist, dist_ang, inc, draw_x, draw_y;
    x1 = argument[0];
    y1 = argument[1];
    x2 = argument[2];
    y2 = argument[3];
    start_angle = argument[4];
    detail = argument[5];
 
    dist = point_distance(x1,y1,x2,y2);
    dist_ang = angle_difference(point_direction(x1,y1,x2,y2),start_angle);
    inc = (1/detail);
 
    draw_primitive_begin(pr_linestrip);
    for (i=0; i<1+inc; i+=inc) {
        draw_x = x1 + (lengthdir_x(i * dist, i * dist_ang + start_angle));
        draw_y = y1 + (lengthdir_y(i * dist, i * dist_ang + start_angle));
        draw_vertex(draw_x,draw_y);
    }
    draw_primitive_end();
    return 0;
}

function draw_pie() {
    var x1,y1,x2,y2,x3,y3,x4,y4,outline,precision;
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    x3 = argument4;
    y3 = argument5;
    x4 = argument6;
    y4 = argument7;
    outline = argument8;
    precision = argument9;
    if (precision == 0) precision = 24;
    var res,xm,ym,xr,yr,r,a1,a2,sx,sy,a;
    res = 360 / min(max(4,4*(precision div 4)),64);
    xm = (x1+x2)/2;
    ym = (y1+y2)/2;
    xr = abs(x2-x1)/2;
    yr = abs(y2-y1)/2;
    if (xr > 0) r = yr/xr;
    else r = 0;
    a1 = point_direction(0,0,(x3-xm)*r,y3-ym);
    a2 = point_direction(0,0,(x4-xm)*r,y4-ym);
    if (a2<a1) a2 += 360;
    if (outline) draw_primitive_begin(pr_linestrip);
    else draw_primitive_begin(pr_trianglefan);
    draw_vertex(xm,ym);
    sx = xm+lengthdir_x(xr,a1);
    sy = ym+lengthdir_y(yr,a1);
    draw_vertex(sx,sy);
    for (a=res*(a1 div res + 1); a<a2; a+=res) {
        sx = xm+lengthdir_x(xr,a);
        sy = ym+lengthdir_y(yr,a);
        draw_vertex(sx,sy);
    }
    sx = xm+lengthdir_x(xr,a2);
    sy = ym+lengthdir_y(yr,a2);
    draw_vertex(sx,sy);
    if (outline) draw_vertex(xm,ym);
    draw_primitive_end();
    return 0;
}

function draw_rectangle_dashed() {
    // initialize the script on the first call
    if (!variable_global_exists("_DRAW_RECT_DASH_SPR")) {
        var i,j,k,l;
        i = draw_getpixel(0,0);
        j = draw_getpixel(1,0);
        k = draw_getpixel(0,1);
        l = draw_getpixel(1,1);
        draw_point_color(0,0,c_white);
        draw_point_color(1,0,c_black);
        draw_point_color(0,1,c_black);
        draw_point_color(1,1,c_white);
        global._DRAW_RECT_DASH_SPR = sprite_create_from_screen(0,0,2,2,0,1,0,0,0,0);
        global._DRAW_RECT_DASH_TEX = sprite_get_texture(global._DRAW_RECT_DASH_SPR,0);
        draw_point_color(0,0,i);
        draw_point_color(1,0,j);
        draw_point_color(0,1,k);
        draw_point_color(1,1,l);
    }
 
    // main script begin
    var x1,y1,x2,y2,u1,v1,u2,v2,color,alpha;
    x1 = min(argument0,argument2);
    y1 = min(argument1,argument3);
    x2 = max(argument0,argument2);
    y2 = max(argument1,argument3);
 
    // scale and center texture UV coordinates
    argument4 = max(1,argument4);
    u2 = (x2-x1)/(2*argument4);
    v2 = (y2-y1)/(2*argument4);
    u1 = 0.25  - (u2 mod 2) / 2;
    v1 = 0.25  - (v2 mod 2) / 2;
    u2 += u1;
    v2 += v1;
 
    // draw textured rectangle using the default color and alpha
    color = draw_get_color();
    alpha = draw_get_alpha();
    texture_set_repeat(1);    
    draw_primitive_begin_texture(pr_linestrip, global._DRAW_RECT_DASH_TEX);
    draw_vertex_texture_color(x1, y1, u1, v1, color, alpha);
    draw_vertex_texture_color(x2, y1, u2, v1, color, alpha);
    draw_vertex_texture_color(x2, y2, u2, v2, color, alpha);
    draw_vertex_texture_color(x1, y2, u1, v2, color, alpha);
    draw_vertex_texture_color(x1, y1, u1, v1, color, alpha);
    draw_primitive_end(); 
    return 0;
}

function draw_rectangle_dashed_color() {
    // initialize the script on the first call
    if (!variable_global_exists("_DRAW_RECT_DASH_SPR")) {
        var i,j,k,l;
        i = draw_getpixel(0,0);
        j = draw_getpixel(1,0);
        k = draw_getpixel(0,1);
        l = draw_getpixel(1,1);
        draw_point_color(0,0,c_white);
        draw_point_color(1,0,c_black);
        draw_point_color(0,1,c_black);
        draw_point_color(1,1,c_white);
        global._DRAW_RECT_DASH_SPR = sprite_create_from_screen(0,0,2,2,0,1,0,0,0,0);
        global._DRAW_RECT_DASH_TEX = sprite_get_texture(global._DRAW_RECT_DASH_SPR,0);
        draw_point_color(0,0,i);
        draw_point_color(1,0,j);
        draw_point_color(0,1,k);
        draw_point_color(1,1,l);
    }
 
    // main script begin
    var x1,y1,x2,y2,u1,v1,u2,v2,alpha;
    x1 = min(argument0,argument2);
    y1 = min(argument1,argument3);
    x2 = max(argument0,argument2);
    y2 = max(argument1,argument3);
 
    // scale and center texture UV coordinates
    argument8 = max(1,argument8);
    u2 = (x2-x1)/(2*argument8);
    v2 = (y2-y1)/(2*argument8);
    u1 = 0.25 - (u2 mod 2)/2;
    v1 = 0.25 - (v2 mod 2)/2;
    u2 += u1;
    v2 += v1;
 
    // draw textured rectangle using the given colors and default alpha
    alpha = draw_get_alpha();
    texture_set_repeat(1);    
    draw_primitive_begin_texture(pr_linestrip, global._DRAW_RECT_DASH_TEX);
    draw_vertex_texture_color(x1, y1, u1, v1, argument4, alpha);
    draw_vertex_texture_color(x2, y1, u2, v1, argument5, alpha);
    draw_vertex_texture_color(x2, y2, u2, v2, argument6, alpha);
    draw_vertex_texture_color(x1, y2, u1, v2, argument7, alpha);
    draw_vertex_texture_color(x1, y1, u1, v1, argument4, alpha);
    draw_primitive_end(); 
    return 0;
}

function draw_rectangle_inverted() {
    draw_set_blend_mode_ext(bm_inv_dest_color,bm_inv_src_color);
    draw_rectangle_color(argument0,argument1,argument2,argument3,c_white,c_white,c_white,c_white,0);
    draw_set_blend_mode(bm_normal);
    return 0;
}

function draw_roundrect_ext() {
    var x1,y1,x2,y2,out,rad,pre,i,j,x1r,x2r,y1r,y2r;
    x1  = argument0;
    y1  = argument1;
    x2  = argument2;
    y2  = argument3;
    out = argument4;
    rad = min(argument5,abs(x1-x2)/2,abs(y1-y2)/2);
    pre = max(1,argument6);
 
    i   = 0;
    j   = 90 / pre;
    x1r = x1 + rad;
    x2r = x2 - rad;
    y1r = y1 + rad;
    y2r = y2 - rad;
 
    if (out) {
        draw_primitive_begin(pr_linestrip);
    }else{
        draw_primitive_begin(pr_trianglefan);
        draw_vertex(mean(x1,x2),mean(y1,y2)); 
    }
    draw_vertex(x2,y2r);
    draw_vertex(x2,y1r);
    repeat (pre) {
        i += j;
        draw_vertex(x2r+lengthdir_x(rad,i),y1r+lengthdir_y(rad,i));
    }
    draw_vertex(x1r,y1);
    repeat (pre) {
        i += j;
        draw_vertex(x1r+lengthdir_x(rad,i),y1r+lengthdir_y(rad,i));
    }
    draw_vertex(x1,y2r);
    repeat (pre) {
        i += j;
        draw_vertex(x1r+lengthdir_x(rad,i),y2r+lengthdir_y(rad,i));
    }
    draw_vertex(x2r,y2);
    repeat (pre) {
        i += j;
        draw_vertex(x2r+lengthdir_x(rad,i),y2r+lengthdir_y(rad,i));
    }
    draw_vertex(x2,y2r);
    draw_primitive_end();
    return 0;
}

