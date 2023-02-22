function collision_line_first() {
    var ox,oy,dx,dy,object,prec,notme,sx,sy,inst,i;
    ox = argument0;
    oy = argument1;
    dx = argument2;
    dy = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = dx - ox;
    sy = dy - oy;
    inst = collision_line(ox,oy,dx,dy,object,prec,notme);
    if (inst != noone) {
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            i = collision_line(ox,oy,dx,dy,object,prec,notme);
            if (i) {
                dx -= sx;
                dy -= sy;
                inst = i;
            }else{
                dx += sx;
                dy += sy;
            }
        }
    }
    return inst;
}

function collision_normal() {
    var xx  = argument[0];
    var yy  = argument[1];
    var obj = argument[2];
    var rad = 4;
    var res = 1;
    if (argument_count > 3) rad = argument[3];
    if (argument_count > 4) res = argument[4];
    if (rad <= 0) rad = 4;
    if (res <= 0) res = 1;
    var nx = 0;
    var ny = 0;
    if (collision_circle(xx, yy, rad, obj, true, true)) {
        for (var j=res; j<=rad; j+=res) {
            for (var i=0; i<rad; i+=res) {
                if (point_distance(0, 0, i, j) <= rad) {
                    if (!collision_point(xx+i, yy+j, obj, true, true)) { nx += i; ny += j; }
                    if (!collision_point(xx+j, yy-i, obj, true, true)) { nx += j; ny -= i; }
                    if (!collision_point(xx-i, yy-j, obj, true, true)) { nx -= i; ny -= j; }
                    if (!collision_point(xx-j, yy+i, obj, true, true)) { nx -= j; ny += i; }
                }
            }
        }
        if (nx == 0 && ny == 0) return (-1);
        return point_direction(0, 0, nx, ny);
    }else{
        return (-1);
    }
}

function collision_triangle() {
   var x1,y1,x2,y2,x3,y3,object,xmin,xmax,ymin,ymax,d12,d13,d23,d14,d24,t,dx,dy,x4,y4;
   x1 = argument0;
   y1 = argument1;
   x2 = argument2;
   y2 = argument3;
   x3 = argument4;
   y3 = argument5;
   object = argument6;
 
   // Bounding box check
   xmin = min(x1,x2,x3);
   xmax = max(x1,x2,x3);
   ymin = min(y1,y2,y3);
   ymax = max(y1,y2,y3);
   if (not collision_rectangle(xmin,ymin,xmax,ymax,object,false,false)) return false;
 
   // Triangle perimeter check
   if (collision_line(x1,y1,x2,y2,object,true,false)) return true;
   if (collision_line(x1,y1,x3,y3,object,true,false)) return true;
   if (collision_line(x2,y2,x3,y3,object,true,false)) return true;
 
   // Find long side, make it (x1,y2) to (x2,y2)
   d12 = point_distance(x1,y1,x2,y2);
   d13 = point_distance(x1,y1,x3,y3);
   d23 = point_distance(x2,y2,x3,y3);
   switch (max(d12,d13,d23)) {
       case d13:
           t = x2; x2 = x3; x3 = t;
           t = y2; y2 = y3; y3 = t;
           d12 = d13;
           break;
       case d23:
           t = x1; x1 = x3; x3 = t;
           t = y1; y1 = y3; y3 = t;
           d12 = d23;
           break;
   }
 
   // From (x3,y3), find nearest point on long side (x4,y4).
   dx = x2 - x1;
   dy = y2 - y1;
   if ((dx == 0) && (dy == 0)) {
       x4 = x1;
       y4 = y1;
   }else{
       t = ((x3 - x1) * dx + (y3 - y1) * dy) / (d12 * d12);
       x4 = x1 + t * dx;
       y4 = y1 + t * dy;
   }
 
   // A line constructed from (x3,y3) to (x4,y4) divides
   // the original triangle into two right triangles.
   // Fit the collision mask into these triangles.
   d14 = point_distance(x1,y1,x4,y4);
   d24 = d12 - d14;
   with (global.objCollisionTriangle) {
       image_angle  = point_direction(x1,y1,x4,y4);
       image_xscale = d14 / size;
       image_yscale = point_distance(x3,y3,x4,y4) / size;
       if ((x1 > x4) xor (y3 < y4)) image_yscale *= -1;
       if (place_meeting(x4,y4,object)) return true;
       image_xscale = -d24 / size;
       if (place_meeting(x4,y4,object)) return true;
   }
   return false;
}

function range_finder() {
    var ox,oy,dir,range,object,prec,notme,dx,dy,sx,sy,distance;
    ox = argument0;
    oy = argument1;
    dir = argument2;
    range = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = lengthdir_x(range,dir);
    sy = lengthdir_y(range,dir);
    dx = ox + sx;
    dy = oy + sy;
    if (collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
        distance = -1;
    }else{
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            if (collision_line(ox,oy,dx,dy,object,prec,notme) < 0) {
                dx += sx;
                dy += sy;
            }else{
                dx -= sx;
                dy -= sy;
            }
        }
        distance = point_distance(ox,oy,dx,dy);
    }
    return distance;
}
