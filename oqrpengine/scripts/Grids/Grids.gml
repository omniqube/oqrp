function ds_grid_delete_column() {
    var grid = argument0;
    var col = argument1;
 
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);
 
    ds_grid_set_grid_region(grid, grid, col+1, 0, w-1, h-1, col, 0);
    ds_grid_resize(grid, w-1, h);
}

function ds_grid_delete_row() {
    var grid = argument0;
    var row = argument1;
 
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);
 
    ds_grid_set_grid_region(grid, grid, 0, row+1, w-1, h-1, 0, row);
    ds_grid_resize(grid, w, h-1);
}

function ds_grid_duplicate(grid)
{
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);
    var newgrid = ds_grid_create(w, h);
    ds_grid_copy(newgrid, grid);
    return newgrid;
}

function ds_grid_filter_gaussian(grid, sigma)
{
    if (sigma > 0)
    {
        //  Select suitable filter size for sigma
        var size = ceil(6 * sigma);
        var n = 2 * sqr(sigma);
        var d = 1 / (sqrt(2*pi) * sigma);
 
        //  Compute Gaussian coefficients
        var g;
        for (var i=size; i>=0; i--)
        {
            g[i] = exp(-sqr(i) / n) * d;
        }
 
        //  Create working grids
        var w = ds_grid_width(grid);
        var h = ds_grid_height(grid);
 
        var work1 = ds_grid_create(w, h);
        var work2 = ds_grid_create(w, h);
 
        //  Filter horizontally
        ds_grid_copy(work1, grid);
        ds_grid_multiply_region(work1, 0, 0, w-1, h-1, g[0]);
        for (i=1; i<=size; i++)
        {
            ds_grid_copy(work2, grid);
            ds_grid_multiply_region(work2, 0, 0, w-1, h-1, g[i]);
            ds_grid_add_grid_region(work1, work2, 0, 0, w-1, h-1,  i, 0);
            ds_grid_add_grid_region(work1, work2, 0, 0, w-1, h-1, -i, 0);
        }
 
        //  Filter vertically
        ds_grid_copy(grid,work1);
        ds_grid_multiply_region(grid, 0, 0, w-1, h-1, g[0]);
        for (i=1; i<=size; i++)
        {
            ds_grid_copy(work2,work1);
            ds_grid_multiply_region(work2, 0, 0, w-1, h-1, g[i]);
            ds_grid_add_grid_region(grid, work2, 0, 0, w-1, h-1, 0,  i);
            ds_grid_add_grid_region(grid, work2, 0, 0, w-1, h-1, 0, -i);
        }
 
        //  Clean up
        ds_grid_destroy(work1);
        ds_grid_destroy(work2);
    }
}

function ds_grid_draw() {
    var grid = argument0;
    var sx = argument1;
    var sy = argument2;
 
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);
 
    var M = ds_grid_get_max(grid,0,0,w-1,h-1);
    var m = ds_grid_get_min(grid,0,0,w-1,h-1);
    if (M == m) var f = 0 else var f = 1/(M-m);
 
    for (var i=0; i<w; i++)
    {
        for (var j=0; j<h; j++)
        {
            var value = f*(ds_grid_get(grid,i,j)-m);
            draw_point_color(sx+i,sy+j,make_color_hsv(0,0,clamp(255*value,0,255)));
        }
    }
 
    return 0;
}

function ds_grid_filter_gaussian_wrap() {
    var grid = argument0;
    var sigma = argument1;
 
    if (sigma > 0)
    {
        //  Select suitable filter size for sigma
        var size = ceil(6*sigma);
        var n = 2*sqr(sigma);
        var d = 1/(sqrt(2*pi)*sigma);
 
        //  Compute Gaussian coefficients
        var g;
        for (var i=size; i>=0; i--)
        {
            g[i] = exp(-sqr(i)/n)*d;
        }
 
        //  Create working grids
        var w = ds_grid_width(grid);
        var h = ds_grid_height(grid);
 
        var work1 = ds_grid_create(w,h);
        var work2 = ds_grid_create(w,h);
 
        //  Filter horizontally
        ds_grid_copy(work1,grid);
        ds_grid_multiply_region(work1,0,0,w-1,h-1,g[0]);
        for (i=1; i<=size; i++)
        {
            ds_grid_copy(work2,grid);
            ds_grid_multiply_region(work2,0,0,w-1,h-1,g[i]);
            ds_grid_add_grid_region(work1,work2,0,0,w-1,h-1,i,0);
            ds_grid_add_grid_region(work1,work2,0,0,w-1,h-1,-i,0);
        }
 
        //  Filter vertically
        ds_grid_copy(grid,work1);
        ds_grid_multiply_region(grid,0,0,w-1,h-1,g[0]);
        for (i=1; i<=size; i++)
        {
            ds_grid_copy(work2,work1);
            ds_grid_multiply_region(work2,0,0,w-1,h-1,g[i]);
            ds_grid_add_grid_region(grid,work2,0,0,w-1,h-1,0,i);
            ds_grid_add_grid_region(grid,work2,0,0,w-1,h-1,0,-i);
        }
 
        //  Clean up
        ds_grid_destroy(work1);
        ds_grid_destroy(work2);
    }
    return 0;
}

function ds_grid_flood_fill() {
    var grid = argument0;
    var seedx = argument1;
    var seedy = argument2;
    var newval = argument3;
 
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);
 
    var oldval = grid[# seedx, seedy];
 
    var stackx = ds_queue_create();
    var stacky = ds_queue_create();
 
    ds_queue_enqueue(stackx, seedx);
    ds_queue_enqueue(stacky, seedy);
 
    while (ds_queue_size(stackx))
    {
        var px = ds_queue_dequeue(stackx);
        var py = ds_queue_dequeue(stacky);
        var y1 = py;
        while (y1 >= 0 && grid[# px, y1] == oldval) y1--;
        y1++;
        var spanLeft = false;
        var spanRight = false;
        while (y1 < h && grid[# px, y1] == oldval)
        {
            grid[# px,y1] = newval;
            if (!spanLeft && px > 0 && grid[# px-1, y1] == oldval)
            {
                ds_queue_enqueue(stackx, px-1);
                ds_queue_enqueue(stacky, y1);
                spanLeft = true;
            }
            else if (spanLeft && px > 0 && grid[# px-1, y1] != oldval)
            {
                spanLeft = false;
            }
            if (!spanRight && px < w-1 && grid[# px+1, y1] == oldval)
            {
                ds_queue_enqueue(stackx, px+1);
                ds_queue_enqueue(stacky, y1);
                spanRight = true;
            }
            else if (spanRight && px < w-1 && grid[# px+1, y1] != oldval)
            {
                spanRight = false;
            }
            y1++;
        }
    }
 
    ds_queue_destroy(stackx);
    ds_queue_destroy(stacky);
 
    return 0;
}

function ds_grid_get_bicubic() {
    var ix,iy,fx,fy;
    ix = floor(argument1);
    iy = floor(argument2);
    fx = argument1 - ix;
    fy = argument2 - iy;
 
    return spline4(fx,
        spline4(fy,
            ds_grid_get(argument0,ix-1,iy-1),
            ds_grid_get(argument0,ix-1,iy  ),
            ds_grid_get(argument0,ix-1,iy+1),
            ds_grid_get(argument0,ix-1,iy+2)),
        spline4(fy,
            ds_grid_get(argument0,ix  ,iy-1),
            ds_grid_get(argument0,ix  ,iy  ),
            ds_grid_get(argument0,ix  ,iy+1),
            ds_grid_get(argument0,ix  ,iy+2)),
        spline4(fy,
            ds_grid_get(argument0,ix+1,iy-1),
            ds_grid_get(argument0,ix+1,iy  ),
            ds_grid_get(argument0,ix+1,iy+1),
            ds_grid_get(argument0,ix+1,iy+2)),
        spline4(fy,
            ds_grid_get(argument0,ix+2,iy-1),
            ds_grid_get(argument0,ix+2,iy  ),
            ds_grid_get(argument0,ix+2,iy+1),
            ds_grid_get(argument0,ix+2,iy+2)));
}

function ds_grid_get_biliniar() {
    var ix,iy,fx,fy,A,B;
    ix = floor(argument1);
    iy = floor(argument2);
    fx = argument1 - ix;
    fy = argument2 - iy;
 
    A = ds_grid_get(argument0,ix,iy);
    B = ds_grid_get(argument0,ix+1,iy);
    A += fy*(ds_grid_get(argument0,ix,iy+1)-A);
    B += fy*(ds_grid_get(argument0,ix+1,iy+1)-B);
    return A+fx*(B-A);
}

function ds_grid_mirror() {
    var dsid,horiz,vert,w,h,temp;
    dsid = argument0;
    horiz = argument1;
    vert = argument2;
    w = ds_grid_width(dsid);
    h = ds_grid_height(dsid);
    temp = ds_grid_create(w,h);
    if (horiz) {
        for (i=0;i<w;i+=1) {
            ds_grid_set_grid_region(temp,dsid,i,0,i,h-1,w-i-1,0);
        }
        ds_grid_copy(dsid,temp);
    }
    if (vert) {
        for (i=0;i<h;i+=1) {
            ds_grid_set_grid_region(temp,dsid,0,i,w-1,i,0,h-i-1);
        }
        ds_grid_copy(dsid,temp);
    }
    ds_grid_destroy(temp);
    return 0;
}

function ds_grid_swap_columns() {
    var i, temp;
    i = 0;
    repeat (ds_grid_height(argument0)) {
        temp = ds_grid_get(argument0, argument1, i);
        ds_grid_set(argument0, argument1, i, ds_grid_get(argument0, argument2, i));
        ds_grid_set(argument0, argument2, i, temp);
        i += 1;
    }
    return 0;
}

function ds_grid_swap_rows() {
    var i, temp;
    i = 0;
    repeat (ds_grid_width(argument0)) {
        temp = ds_grid_get(argument0, i, argument1);
        ds_grid_set(argument0, i, argument1, ds_grid_get(argument0, i, argument2));
        ds_grid_set(argument0, i, argument2, temp);
        i += 1;
    }
    return 0;
}

function ds_grid_translate() {
    var dsid,w,h,sx,sy,mx,my,dx,dy,temp;
    dsid = argument0;
    w = ds_grid_width(dsid);
    h = ds_grid_height(dsid);
    sx = (((argument1 mod w)+w) mod w);
    sy = (((argument2 mod h)+h) mod h);
    mx = w-1;
    my = h-1;
    dx = mx-sx;
    dy = my-sy;
    temp = ds_grid_create(w,h);
    ds_grid_set_grid_region(temp,dsid,0,0,dx,dy,sx,sy);
    if (sx>0) ds_grid_set_grid_region(temp,dsid,dx+1,0,mx,dy,0,sy);
    if (sy>0) ds_grid_set_grid_region(temp,dsid,0,dy+1,dx,my,sx,0);
    if ((sx>0) && (sy>0)) ds_grid_set_grid_region(temp,dsid,dx+1,dy+1,mx,my,0,0);
    ds_grid_copy(dsid,temp);
    ds_grid_destroy(temp);
    return 0;
}
