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
var _filename = "screenshot-" + string(current_year) + "-" + string(current_month) + "-" + string(current_day) + "--" + string(current_hour) + "-" + string(current_minute) + "-" + string(current_second) + ".png";
screen_save(global.oqrp_screenshot_directory + _filename);
}
