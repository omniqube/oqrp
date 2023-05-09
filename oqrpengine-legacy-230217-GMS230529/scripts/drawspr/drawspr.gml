function draw_sprite_flip_ext() {
    var sprite,subimg,posx,posy,xscale,yscale,rot,color,alpha,fliph,flipv;
    sprite = argument0;
    subimg = argument1;
    posx   = argument2;
    posy   = argument3;
    xscale = argument4;
    yscale = argument5;
    rot    = argument6;
    color  = argument7;
    alpha  = argument8;
    fliph  = argument9;
    flipv  = argument10;
 
    if (fliph) {
        posx  = 2 * (sprite_get_width(sprite) - sprite_get_xoffset(sprite));
        posx  = xscale * (posx - sprite_get_bbox_right(sprite)) + argument2;
        xscale *= -1;
    }
    if (flipv) {
        posy  = 2 * (sprite_get_height(sprite) - sprite_get_yoffset(sprite));
        posy  = yscale * (posy - sprite_get_bbox_bottom(sprite)) + argument3;
        yscale *= -1;
    }
    draw_sprite_ext(sprite,subimg,posx,posy,xscale,yscale,rot,color,alpha);
    return 0;
}

function draw_sprite_halfpixel() {
    d3d_transform_stack_push();
    d3d_transform_add_translation(-0.5, -0.5, 0);
    d3d_transform_add_rotation_z(argument6);
    d3d_transform_add_scaling(argument4, argument5, 1);
    d3d_transform_add_translation(argument2+0.5, argument3+0.5, 0);
    draw_sprite_ext(argument0, argument1, 0, 0, 1, 1, 0, argument7, argument8);
    d3d_transform_stack_pop();
    return 0;
}

function draw_sprite_hud() {
    var xoffset,yoffset,tx,ty;
 
    xoffset = argument2;
    yoffset = argument3;
 
    tx = view_xview[0] + view_wview[0]/2 + lengthdir_x(xoffset-view_wview[0]/2,-view_angle[0]) 
        + lengthdir_x(yoffset-view_hview[0]/2,-view_angle[0]-90);
    ty = view_yview[0] + view_hview[0]/2 + lengthdir_y(xoffset-view_wview[0]/2,-view_angle[0]) 
        + lengthdir_y(yoffset-view_hview[0]/2,-view_angle[0]-90);
 
    draw_sprite_ext(argument0,argument1,tx,ty,argument4,argument5,
        -view_angle[0]+argument6,argument7,argument8);
    return 0;
}

function draw_sprite_inverted() {
    var w = sprite_get_width(argument0);
    var h = sprite_get_height(argument0);
    var xo = sprite_get_xoffset(argument0);
    var yo = sprite_get_yoffset(argument0);
    var a = draw_get_alpha();
    draw_set_alpha(0);
    d3d_transform_stack_push();
    d3d_transform_add_translation(argument2-xo,argument3-yo,0);
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
    draw_rectangle_color(0,0,w,h,c_white,c_white,c_white,c_white,false);
    draw_set_blend_mode_ext(bm_src_alpha, bm_inv_src_alpha);
    draw_sprite_ext(argument0,argument1,xo,yo,1,1,0,c_white,1);
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
    draw_rectangle_color(0,0,w,h,c_white,c_white,c_white,c_white,false);
    d3d_transform_stack_pop();
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(a);
    return 0;
}

function draw_sprite_inverted_ext() {
    var w = sprite_get_width(argument0);
    var h = sprite_get_height(argument0);
    var xo = sprite_get_xoffset(argument0);
    var yo = sprite_get_yoffset(argument0);
    var a = draw_get_alpha();
    draw_set_alpha(0);
    d3d_transform_stack_push();
    d3d_transform_add_translation(-xo,-yo,0);
    d3d_transform_add_scaling(argument4,argument5,1);
    d3d_transform_add_rotation_z(argument6);
    d3d_transform_add_translation(argument2,argument3,0);
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
    draw_rectangle_color(0,0,w,h,c_white,c_white,c_white,c_white,false);
    draw_set_blend_mode_ext(bm_src_alpha, bm_inv_src_alpha);
    draw_sprite_ext(argument0,argument1,xo,yo,1,1,0,argument7,argument8);
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
    draw_rectangle_color(0,0,w,h,c_white,c_white,c_white,c_white,false);
    d3d_transform_stack_pop();
    draw_set_blend_mode(bm_normal);
    draw_set_alpha(a);
    return 0;
}

function draw_sprite_percent() {
    var n,index;
    n = sprite_get_number(argument0);
    if (argument1 >= 100) index = (n-1);
    else if (argument1 <= 0) index = 0;
    else{
        index = round(argument1*(n-1)/100);
        if (argument4) index = min(max(1,index),(n-2));
    }
    draw_sprite(argument0,index,argument2,argument3);
    return index;
}

function draw_sprite_rectangle() {
    var spr = argument0,
        img = argument1,
        x1  = argument2,
        y1  = argument3,
        x2  = argument4,
        y2  = argument5,
        l   = argument6,
        t   = argument7,
        r   = argument8,
        b   = argument9;
 
    var x3 = x1 + l;
    var y3 = y1 + t;
    var x4 = x2 - r + 1;
    var y4 = y2 - b + 1;
    var x5 = sprite_get_width(spr) - r;
    var y5 = sprite_get_height(spr) - b;
    var w = x5 - l;
    var h = y5 - t;
    var xs = (x4 - x3) / w;
    var ys = (y4 - y3) / h;
 
    draw_sprite_part_ext(spr, img, 0,  0,  l, t, x1, y1, 1.0, 1.0, c_white, 1.0);
    draw_sprite_part_ext(spr, img, l,  0,  w, t, x3, y1, xs,  1.0, c_white, 1.0);
    draw_sprite_part_ext(spr, img, x5, 0,  r, t, x4, y1, 1.0, 1.0, c_white, 1.0);
    draw_sprite_part_ext(spr, img, 0,  t,  l, h, x1, y3, 1.0, ys,  c_white, 1.0);
    draw_sprite_part_ext(spr, img, l,  t,  w, h, x3, y3, xs,  ys,  c_white, 1.0);
    draw_sprite_part_ext(spr, img, x5, t,  r, h, x4, y3, 1.0, ys,  c_white, 1.0);
    draw_sprite_part_ext(spr, img, 0,  y5, l, b, x1, y4, 1.0, 1.0, c_white, 1.0);
    draw_sprite_part_ext(spr, img, l,  y5, w, b, x3, y4, xs,  1.0, c_white, 1.0);
    draw_sprite_part_ext(spr, img, x5, y5, r, b, x4, y4, 1.0, 1.0, c_white, 1.0);
 
    return 0;
}

function draw_sprite_shear() {
    var spr = argument0;
    var sub = argument1;
    var xps = argument2;
    var yps = argument3;
    var xsh = argument4;
    var ysh = argument5;
 
    var M;
    M[15] = 1;  M[14] = 0;  M[13] = 0;    M[12] = 0;
    M[11] = 0;  M[10] = 1;  M[9]  = 0;    M[8]  = 0;
    M[7]  = 0;  M[6]  = 0;  M[5]  = 1;    M[4]  = xsh;
    M[3]  = 0;  M[2]  = 0;  M[1]  = ysh;  M[0]  = 1;
 
    d3d_transform_stack_push();
    matrix_set(matrix_world, M);
    d3d_transform_add_translation(xps, yps, 0);
    draw_sprite(spr, sub, 0, 0);
    d3d_transform_stack_pop();
    return 0;
}

function draw_sprite_stretched_direction() {
    d3d_transform_stack_push();
    d3d_transform_add_rotation_z(-argument5);
    d3d_transform_add_scaling(argument4,1,1);
    d3d_transform_add_rotation_z(argument5);
    d3d_transform_add_translation(argument2,argument3,0);
    draw_sprite(argument0,argument1,0,0);
    d3d_transform_stack_pop();
    return 0;
}

function draw_sprite_tiled_area() {
    var sprite,subimg,xx,yy,x1,y1,x2,y2;
    sprite = argument0;
    subimg = argument1;
    xx = argument2;
    yy = argument3;
    x1 = argument4;
    y1 = argument5;
    x2 = argument6;
    y2 = argument7;
 
    var sw,sh,i,j,jj,left,top,width,height,X,Y;
    sw = sprite_get_width(sprite);
    sh = sprite_get_height(sprite);
 
    i = x1-((x1 mod sw) - (xx mod sw)) - sw*((x1 mod sw)<(xx mod sw));
    j = y1-((y1 mod sh) - (yy mod sh)) - sh*((y1 mod sh)<(yy mod sh)); 
    jj = j;
 
    for(i=i; i<=x2; i+=sw) {
        for(j=j; j<=y2; j+=sh) {
 
            if(i <= x1) left = x1-i;
            else left = 0;
            X = i+left;
 
            if(j <= y1) top = y1-j;
            else top = 0;
            Y = j+top;
 
            if(x2 <= i+sw) width = ((sw)-(i+sw-x2)+1)-left;
            else width = sw-left;
 
            if(y2 <= j+sh) height = ((sh)-(j+sh-y2)+1)-top;
            else height = sh-top;
 
            draw_sprite_part(sprite,subimg,left,top,width,height,X,Y);
        }
        j = jj;
    }
    return 0;
}

function draw_sprite_tiled_area_ext() {
    var sprite,subimg,xx,yy,x1,y1,x2,y2;
    sprite = argument0;
    subimg = argument1;
    xx = argument2;
    yy = argument3;
    x1 = argument4;
    y1 = argument5;
    x2 = argument6;
    y2 = argument7;
 
    var sw,sh,i,j,jj,left,top,width,height,X,Y;
    sw = sprite_get_width(sprite);
    sh = sprite_get_height(sprite);
 
    i = x1 - ((x1 mod sw)-(xx mod sw)) - sw*((x1 mod sw)<(xx mod sw));
    j = y1 - ((y1 mod sh)-(yy mod sh)) - sh*((y1 mod sh)<(yy mod sh)); 
    jj = j;
 
    for(i=i; i<=x2; i+=sw) {
        for(j=j ;j<=y2; j+=sh) {
 
            if(i <= x1) left = x1-i;
            else left = 0;
            X = i+left;
 
            if(j <= y1)top = y1-j;
            else top = 0;
            Y = j+top;
 
            if(x2 <= i+sw) width = ((sw)-(i+sw-x2)+1)-left;
            else width = sw-left;
 
            if(y2 <= j+sh) height = ((sh)-(j+sh-y2)+1)-top;
            else height = sh-top;
 
            draw_sprite_part_ext(sprite,subimg,left,top,width,height,X,Y,1,1,argument8,argument9);
        }
        j = jj;
    }
    return 0;
}

function draw_sprite_wave() {
    var sprite,image,posx,posy,axis,wavelength,amplitude,phase;
    sprite     = argument0;
    image      = argument1;
    posx       = argument2;
    posy       = argument3;
    axis       = argument4;
    wavelength = argument5;
    amplitude  = argument6;
    phase      = argument7;
 
    var width,height,xoff,yoff,size,i,shift,sx,sy;
    width  = sprite_get_width(sprite);
    height = sprite_get_height(sprite);
    xoff   = sprite_get_xoffset(sprite);
    yoff   = sprite_get_yoffset(sprite);
    if (axis) size = height else size = width;
 
    for (i=0; i<size; i+=1) {
        shift = amplitude*sin(2*pi*((i/wavelength)+phase));
        if (axis) {
            sx = shift-xoff+posx;
            sy = i-yoff+posy;
            draw_sprite_part(sprite,image,0,i,width,1,sx,sy);
        }else{
            sx = i-xoff+posx;
            sy = shift-yoff+posy;
            draw_sprite_part(sprite,image,i,0,1,height,sx,sy);
        }
    }
}

function draw_sprite_wave_ext() {
    var sprite,image,posx,posy,axis,wavelength,amplitude,phase,xscale,yscale,blend,alpha;
    sprite = argument0;
    image = argument1;
    posx = argument2;
    posy = argument3;
    axis = argument4;
    wavelength = argument5;
    amplitude = argument6;
    phase = argument7;
    xscale = argument8;
    yscale = argument9;
    blend = argument10;
    alpha = argument11;
 
    var width,height,xoff,yoff,size,i,shift,sx,sy;
    width = sprite_get_width(sprite);
    height = sprite_get_height(sprite);
    xoff = sprite_get_xoffset(sprite);
    yoff = sprite_get_yoffset(sprite);
    if (axis) size = height else size = width;
 
    for (i=0; i<size; i+=1) {
        shift = amplitude*sin(2*pi*((i/wavelength)+phase));
        if (axis) {
            sx = xscale*(shift-xoff)+posx;
            sy = yscale*(i-yoff)+posy;
            draw_sprite_part_ext(sprite,image,0,i,width,1,sx,sy,xscale,yscale,blend,alpha);
        }else{
            sx = xscale*(i-xoff)+posx;
            sy = yscale*(shift-yoff)+posy;
            draw_sprite_part_ext(sprite,image,i,0,1,height,sx,sy,xscale,yscale,blend,alpha);
        }
    }
    return 0;
}

function motion_blur() {
    length = argument0;
 
    if (length > 0) {
        step = 3;
        dir = degtorad(argument1);
        px = cos(dir);
        py = -sin(dir);
 
        a = image_alpha/(length/step);
        if (a >= 1) {
            draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,
                image_yscale,image_angle,image_blend,image_alpha);
            a /= 2;
        }
 
        for(i=length;i>=0;i-=step) {
            draw_sprite_ext(sprite_index,image_index,x+(px*i),y+(py*i),
                image_xscale,image_yscale,image_angle,image_blend,a);
        }
    } else {    
        draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,
            image_yscale,image_angle,image_blend,image_alpha);
    }
    return 0;
}