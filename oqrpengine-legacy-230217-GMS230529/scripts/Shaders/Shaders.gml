function shader_set_uniform_color() {
    shader_set_uniform_f(argument0, 
                         color_get_red(argument1) / 255, 
                         color_get_green(argument1) / 255,
                         color_get_blue(argument1) / 255,
                         argument2);
    return 0;
}

function shader_set_uniform_rgba() {
    shader_set_uniform_f(argument0,
                         argument1 / 255,
                         argument2 / 255,
                         argument3 / 255,
                         argument4);
    return 0;
}