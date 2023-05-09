/// point_in_polygon(x,y,polygon)
//
//  Returns true if the given test point is inside 
//  the given 2D polygon, false otherwise.
//
//      x,y         coordinates of the test point
//      polygon     ds_list of an ordered series of coordinate 
//                  pairs defining the shape of a polygon
//
//  Polygons are closed figures with edges spanning consecutive
//  vertices and from the last vertex to the first.

function point_in_polygon() {
    var x0, y0, polygon, inside;
    var n, i, polyX, polyY, x1, y1, x2, y2;
    x0 = argument0;
    y0 = argument1;
    polygon = argument2;
    inside = false;
    n = ds_list_size(polygon) div 2;
    for (i=0; i<n; i+=1)
    {
        polyX[i] = ds_list_find_value(polygon, 2*i);
        polyY[i] = ds_list_find_value(polygon, 2*i+1);
    }
    polyX[n] = polyX[0];
    polyY[n] = polyY[0];
    for (i=0; i<n; i+=1)
    {
        x1 = polyX[i];
        y1 = polyY[i];
        x2 = polyX[i+1];
        y2 = polyY[i+1];
 
        if ((y2 > y0) != (y1 > y0)) 
        {
            inside ^= (x0 < (x1-x2) * (y0-y2) / (y1-y2) + x2);
        }       
    }
    return inside;
}

function point_line_distance() {
    var dx, dy, t, segment;
    dx = argument4-argument2;
    dy = argument5-argument3;
    if ((dx == 0) && (dy == 0)) 
    {
        x0 = argument2;
        y0 = argument3;
    }
    else
    {
        t = (dx*(argument0-argument2) + dy*(argument1-argument3)) / (dx*dx+dy*dy);
        if (argument6) t = clamp(t, 0, 1);
        x0 = argument2 + t * dx;
        y0 = argument3 + t * dy;
    }
    return point_distance(x0, y0, argument0, argument1);
}