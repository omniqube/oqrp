function deceleration_distance() {
    var s,f;
    s = argument0;
    f = argument1;
    if (f == 0) return -1 else return (s*(s-f))/(2*f);
}

function instance_closest_approach() {
    var x1,y1,x2,y2,dh,dv,t;
    x1 = x;
    y1 = y;    
    x2 = argument0.x;
    y2 = argument0.y;
    dh = argument0.hspeed - hspeed;
    dv = argument0.vspeed - vspeed;
    if ((dh == 0) && (dv == 0)) {
        if (argument1) return 0;
        else return point_distance(x,y,argument0.x,argument0.y);
    }else{
        t = -((x2 - x1) * dh + (y2 - y1) * dv) / (sqr(dh) + sqr(dv));
        if (argument1) return t;
        else return sign(t) * point_distance(x + t * hspeed, y + t * vspeed,
        argument0.x + t * argument0.hspeed, argument0.y + t * argument0.vspeed);
    }
}

function instance_find_enemy() {
    var ds,selected;
    ds = ds_priority_create();
    ds_priority_add(ds,noone,100000000);
    with (argument0) {
        if (team != other.team) {
            ds_priority_add(ds,id,point_distance(x,y,other.x,other.y));
        }
    }
    selected = ds_priority_find_min(ds);
    ds_priority_destroy(ds);
    return selected;
}

function instance_find_friend() {
    var ds,selected;
    ds = ds_priority_create();
    ds_priority_add(ds,noone,100000000);
    with (argument0) {
        if (team == other.team && id != other.id) {
            ds_priority_add(ds,id,point_distance(x,y,other.x,other.y));
        }
    }
    selected = ds_priority_find_min(ds);
    ds_priority_destroy(ds);
    return selected;
}

function instance_find_team() {
    var ds,selected;
    ds = ds_priority_create();
    ds_priority_add(ds,noone,100000000);
    with (argument0) {
        if (team == argument1 && id != other.id) {
            ds_priority_add(ds,id,point_distance(x,y,other.x,other.y));
        }
    }
    selected = ds_priority_find_min(ds);
    ds_priority_destroy(ds);
    return selected;
}

function instance_nearest_notme() {
    instance_deactivate_object(self);
    var n = instance_nearest(argument0, argument1, argument2);
    instance_activate_object(self);
    return n;
}

function instance_nth_farthest() {
    var pointx,pointy,object,n,list,farthest;
    pointx = argument0;
    pointy = argument1;
    object = argument2;
    n = argument3;
    n = min(max(1,n),instance_number(object));
    list = ds_priority_create();
    farthest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) farthest = ds_priority_delete_max(list);
    ds_priority_destroy(list);
    return farthest; 
}

function instance_nth_nearest() {
    var pointx,pointy,object,n,list,nearest;
    pointx = argument0;
    pointy = argument1;
    object = argument2;
    n = argument3;
    n = min(max(1,n),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}

function instance_singleton() {
    var obj = argument0;
    if (instance_number(obj) == 0) return instance_create(0, 0, obj);
    return instance_find(obj, 0);
}
