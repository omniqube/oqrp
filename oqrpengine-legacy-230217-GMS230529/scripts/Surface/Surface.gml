function draw_surface_center() {
    var surface,sx,sy,mx,my;
    surface = argument0;
    sx = argument1;
    sy = argument2;
    mx = surface_get_width(surface)/2;
    my = surface_get_height(surface)/2;
    draw_surface(surface,sx-mx,sy-my);
    return 0;
}

function draw_surface_center_ext() {
    var surface,sx,sy,xscale,yscale,rot,color,alpha,mx,my;
    surface = argument0;
    sx = argument1;
    sy = argument2;
    xscale = argument3;
    yscale = argument4;
    rot = argument5;
    color = argument6;
    alpha = argument7;
    mx = surface_get_width(surface)/2;
    my = surface_get_height(surface)/2;
    d3d_transform_stack_push();
    d3d_transform_set_identity();
    d3d_transform_add_translation(-mx,-my,0);
    d3d_transform_add_scaling(xscale,yscale,0);
    d3d_transform_add_rotation_z(rot);
    d3d_transform_add_translation(sx,sy,0);
    draw_surface_ext(surface,0,0,1,1,0,color,alpha);
    d3d_transform_stack_pop();
    return 0;
}

function draw_surface_center_rotate() {
    var surface,sx,sy,angle,mx,my;
    surface = argument0;
    sx = argument1;
    sy = argument2;
    rot = argument3;
    mx = surface_get_width(surface)/2;
    my = surface_get_height(surface)/2;
    d3d_transform_stack_push();
    d3d_transform_set_identity();
    d3d_transform_add_translation(-mx,-my,0);
    d3d_transform_add_rotation_z(rot);
    d3d_transform_add_translation(sx,sy,0);
    draw_surface(surface,0,0);
    d3d_transform_stack_pop();
    return 0;
}

function surface_create_clear() {
    var surf = surface_create(argument0,argument1);
    if (surface_exists(surf))
    {
        surface_set_target(surf);
        draw_clear_alpha(argument2,argument3);
        surface_reset_target();
    }
    return surf;
}
