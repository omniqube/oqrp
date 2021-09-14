if room == enginetestroom
{
if input("pause")
    {
    paused = !paused;
    if paused == false
        {
        instance_activate_all();
        surface_free(paused_surf);
                paused_surf = -1;
        }
    }
if paused == true
    {
    alarm[0]++;
    alarm[1]++;
    }
}

if input("screenshot") {
    var i,fname;
    i = 0;
    do {
        fname = global.oqrp_screenshot_directory+"\\"+"screenshot"+"_"+string(i)+".png";
        i += 1;
    } until (!file_exists(fname))
    screen_save(fname);
    return file_exists(fname);
}
