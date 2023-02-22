function sprite_desaturate(){
    var sprite,w,h,n,xo,yo,surf,i,newsprite,alphasprite;
    sprite = argument0;
 
    w  = sprite_get_width(sprite);
    h  = sprite_get_height(sprite);
    n  = sprite_get_number(sprite);
    xo = sprite_get_xoffset(sprite);
    yo = sprite_get_yoffset(sprite);
 
    surf = surface_create(w,h);
    if (surf < 0) return -1;
    surface_set_target(surf);
    draw_clear_alpha(c_white,1);
    tempsprite = sprite_create_from_surface(surf,0,0,w,h,0,0,xo,yo);
    if (tempsprite < 0) {
        surface_free(surf);
        surface_reset_target();
        return -1;
    }
    for (i=1; i<n; i+=1) sprite_add_from_surface(tempsprite,surf,0,0,w,h,0,0);
    sprite_set_alpha_from_sprite(tempsprite,sprite);
 
    for (i=0; i<n; i+=1) {
        draw_clear_alpha(c_black,1);
        draw_sprite(tempsprite,i,xo,yo);
        draw_set_blend_mode(bm_add);
        draw_rectangle_color(0,0,w,h,c_black,c_black,c_black,c_black,false);
        if (i == 0) {
            newsprite = sprite_create_from_surface(surf,0,0,w,h,0,0,xo,yo);
            if (newsprite < 0) {
                sprite_delete(tempsprite);
                surface_reset_target();
                surface_free(surf);
                return -1;
            }
        }else{
            sprite_add_from_surface(newsprite,surf,0,0,w,h,0,0);
        }
        draw_clear_alpha(c_white,1);
        draw_set_blend_mode_ext(bm_zero,bm_src_alpha);
        draw_sprite(sprite,i,xo,yo);
        if (i == 0) {
            alphasprite = sprite_create_from_surface(surf,0,0,w,h,0,0,xo,yo);
            if (alphasprite < 0) {
                sprite_delete(tempsprite);
                sprite_delete(newsprite);
                surface_reset_target();
                surface_free(surf);
                return -1;
            }
        }else{
            sprite_add_from_surface(alphasprite,surf,0,0,w,h,0,0);
        }
        draw_set_blend_mode(bm_normal);
    }
 
    surface_reset_target();
    sprite_assign(sprite,newsprite);
    sprite_set_alpha_from_sprite(sprite,alphasprite);
    sprite_delete(alphasprite);
    sprite_delete(newsprite);
    sprite_delete(tempsprite);
    surface_free(surf);
    return 0;
}

function sprite_invert_color() {
	    var sprite,w,h,n,xo,yo,surf,a,i,newsprite,alphasprite;
    sprite = argument0;
 
    w  = sprite_get_width(sprite);
    h  = sprite_get_height(sprite);
    n  = sprite_get_number(sprite);
    xo = sprite_get_xoffset(sprite);
    yo = sprite_get_yoffset(sprite);
 
    surf = surface_create(w,h);
    if (surf < 0) return -1;
    surface_set_target(surf);
    a = draw_get_alpha();
    draw_set_alpha(1);
    for (i=0; i<n; i+=1) {
        draw_clear_alpha(c_white,1);
        draw_set_blend_mode_ext(bm_zero,bm_inv_src_color);
        draw_sprite(sprite,i,xo,yo);
        draw_set_blend_mode(bm_add);
        draw_rectangle_color(0,0,w,h,c_black,c_black,c_black,c_black,false);
        if (i == 0) {
            newsprite = sprite_create_from_surface(surf,0,0,w,h,false,false,xo,yo);
            if (newsprite < 0) {
                surface_free(surf);
                return -1;
            }
        }else{
            sprite_add_from_surface(newsprite,surf,0,0,w,h,false,false);
        }
        draw_clear_alpha(c_white,1);
        draw_set_blend_mode_ext(bm_zero,bm_src_alpha);
        draw_sprite(sprite,i,xo,yo);
        if (i == 0) {
            alphasprite = sprite_create_from_surface(surf,0,0,w,h,false,false,xo,yo);
            if (alphasprite < 0) {
                sprite_delete(newsprite);
                surface_free(surf)
                return -1;
            }
        }else{
            sprite_add_from_surface(alphasprite,surf,0,0,w,h,false,false);
        }
        draw_set_blend_mode(bm_normal);
    }
    draw_set_alpha(a);
    surface_reset_target();
    sprite_assign(sprite,newsprite);
    sprite_set_alpha_from_sprite(sprite,alphasprite);
    sprite_delete(newsprite);
    sprite_delete(alphasprite);
    surface_free(surf);
    return 0;
}

function sprite_replace_color() {
	    var sprite, oldc, newc;
    sprite = argument0;
    oldc  = argument1;
    newc  = argument2;
 
    var w, h, n, i, xo, yo, surf, tempsprite, newsprite, alphasprite;
    w  = sprite_get_width(sprite);
    h  = sprite_get_height(sprite);
    n  = sprite_get_number(sprite);
    xo = sprite_get_xoffset(sprite);
    yo = sprite_get_yoffset(sprite);
 
    surf = surface_create(w,h+1);
    surface_set_target(surf);
 
    for(i=0; i<n; i+=1) {
        draw_clear_alpha(oldc,1);
        draw_set_blend_mode_ext(bm_one,bm_zero);
        draw_sprite(sprite,i,xo,yo);
        tempsprite = sprite_create_from_surface(surf,0,0,w,h+1,true,false,xo,yo);
        draw_clear_alpha(newc,1);
        draw_set_blend_mode_ext(bm_src_alpha,bm_inv_src_alpha);
        draw_sprite(tempsprite,0,xo,yo);
        if (i == 0) {
            newsprite = sprite_create_from_surface(surf,0,0,w,h,false,false,xo,yo);
            if (newsprite < 0) return -1;
        }else{
            sprite_add_from_surface(newsprite,surf,0,0,w,h,false,false);
        }     
        draw_clear_alpha(c_white,1);
        draw_set_blend_mode_ext(bm_zero,bm_src_alpha);
        draw_sprite(sprite,i,xo,yo);
        if (i == 0) {
            alphasprite = sprite_create_from_surface(surf,0,0,w,h,false,false,xo,yo);
            if (alphasprite < 0) {
                sprite_delete(newsprite);
                return -1;
            }
        }else{
            sprite_add_from_surface(alphasprite,surf,0,0,w,h,false,false);
        }
        sprite_delete(tempsprite);
    }
 
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    sprite_assign(sprite,newsprite);
    sprite_set_alpha_from_sprite(sprite,alphasprite);
    sprite_delete(newsprite);
    sprite_delete(alphasprite);
    surface_free(surf);
}

/// sprite_replace_color_blend(sprite,oldcolor,newcolor,htol,stol,vtol,blend)
//
//  Replaces one range of colors of a given sprite with another.
//  No new sprites are created, the original sprite is changed.
//  Color is matched and replaced using tolerances and blending
//  in order to preserve the shading of the original sprite.
//
//      sprite      sprite index, real
//      oldcolor    original color, real
//      newcolor    replacement color, real
//      htol        hue tolerance, real
//      stol        saturation tolerance, real
//      vtol        value tolerance, real
//      blend       blend shading, true/false
//
//
//  Notes:
//      This script is extremely slow, especially with large sprites
//      or sprites with many frames.
//
//      Three tolerance arguments (htol,stol,vtol) contol exactly
//      which colors are replaced. A higher tolerance will match
//      a broader range of hue, saturation, or value. Values
//      around (htol = 20; stol = 240; vtol = 240) work well.
//
//      If (blend) is set to true (recommeded), changed colors
//      will retain their original shading.
//
// ----- WARNING: This script is known to be slow in some situations and puts a lot of strain on the GPU.

function sprite_replace_color_blend() {
	var sprite,oldcolor,newcolor,trancolor,htol,stol,vtol,blend;
    sprite = argument0;
    oldcolor = argument1;
    newcolor = argument2;
    htol = argument3;
    stol = argument4;
    vtol = argument5;
    blend = argument6;
 
    var xo,yo,n,w,h,oh,os,ov,nh,ns,nv;
    var surf,i,sx,sy,color,th,ts,tv,dh,ds,dv,hue,sat,val,newsprite;
    xo = sprite_get_xoffset(sprite);
    yo = sprite_get_yoffset(sprite);
    n  = sprite_get_number(sprite);
    w  = sprite_get_width(sprite);
    h  = sprite_get_height(sprite);
    oh = color_get_hue(oldcolor);
    os = color_get_saturation(oldcolor);
    ov = color_get_value(oldcolor);
    nh = color_get_hue(newcolor);
    ns = color_get_saturation(newcolor);
    nv = color_get_value(newcolor);
 
    //  Create surf for sprite editing.
    surf = surface_create(w,h);
    surface_set_target(surf);
 
    //  Process each frame of the original sprite.
    for(i=0; i<n; i+=1) {
        draw_clear_alpha(c_black,1);
        draw_set_blend_mode_ext(bm_one,bm_zero);
        draw_sprite(sprite,i,xo,yo);
 
        //  Check each pixel and change it if within HSV color thresholds.
        for(sx=0; sx<w; sx+=1) {
            for(sy=0; sy<h; sy+=1) {
                color = surface_getpixel(surf,sx,sy);
                th = color_get_hue(color);
                ts = color_get_saturation(color);
                tv = color_get_value(color);
                dh = th-oh;
                ds = ts-os;
                dv = tv-ov;
                if (abs(dh)>128) dh = sign(dh)*256-dh;
                if (abs(dh)<htol && abs(ds)<stol && abs(dv)<vtol) {
                    if (blend) {
                        hue = (nh+dh+256) mod 256;
                        sat = min(max(0,ns+ds),255);
                        val = min(max(0,nv+dv),255);
                        draw_point_color(sx,sy,make_color_hsv(hue,sat,val));
                    }
                }
            }
        }
 
        //  Add current frame to new sprite.
        if (i == 0) {
            newsprite = sprite_create_from_surface(surf,0,0,w,h,false,false,xo,yo);
            if (newsprite < 0) return -1;
        }else{
            sprite_add_from_surface(newsprite,surf,0,0,w,h,false,false);
        }
 
        //  Copy alpha channel from original sprite to alpha sprite.
        draw_clear_alpha(c_white,1);
        draw_set_blend_mode_ext(bm_zero,bm_src_alpha);
        draw_sprite(sprite,i,xo,yo);
        if (i == 0) {
            alphasprite = sprite_create_from_surface(surf,0,0,w,h,false,false,xo,yo);
            if (alphasprite < 0) {
                sprite_delete(newsprite);
                return -1;
            }
        }else{
            sprite_add_from_surface(alphasprite,surf,0,0,w,h,false,false);
        }
    }
 
    //  Replace original sprite with new sprite.
    sprite_assign(sprite,newsprite);
 
    //  Apply original sprite alpha channel to new sprite.
    sprite_set_alpha_from_sprite(sprite,alphasprite);
 
    //  Clean up.
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
    sprite_delete(newsprite);
    sprite_delete(alphasprite);
    surface_free(surf);
    return 0;
}