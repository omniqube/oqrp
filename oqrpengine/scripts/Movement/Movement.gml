function ease_towards_direction() {
    direction += median(-argument1, argument1, (1-argument2) * angle_difference(argument0, direction));
    return 0;
}

function jump_to_mouse() {
    x = mouse_x;
    y = mouse_y;
    return 0;
}

function move_bounce_rectangle() {
    if (bbox_top < argument1)     { y = yprevious; vspeed *= -1; }
    if (bbox_left < argument0)    { x = xprevious; hspeed *= -1; }
    if (bbox_right >= argument2)  { x = xprevious; hspeed *= -1; }
    if (bbox_bottom >= argument3) { y = yprevious; vspeed *= -1; }
    return 0;
}

function move_follow() {
    if (point_distance(x,y,argument0.x,argument0.y) > 0) {
        direction = point_direction(x,y,argument0.x,argument0.y);
        speed = argument1;
    }
    return 0;
}

function move_to_line() {
    var x1,y1,x2,y2,dx,dy,t,segment;
    x1 = argument0;
    y1 = argument1;
    x2 = argument2;
    y2 = argument3;
    segment = argument4;
    dx = x2 - x1;
    dy = y2 - y1;
    if ((dx == 0) && (dy == 0)) {
        x = x1;
        y = y1;
    }else{
        t = ((x - x1) * dx + (y - y1) * dy) / (dx * dx + dy * dy);
        if (segment) t = min(max(0,t),1);
        x = x1 + t * dx;
        y = y1 + t * dy;
    }
    return 0;
}

function turn_towards_direction() {
    direction += median(-argument1, argument1, angle_difference(argument0, direction));
    return 0;
}

