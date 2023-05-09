function select() {
//  Returns an argument selected by n. If n equals 0,
//  the first choice is returned. The selection value
//  is clamped to return a valid argument. If n is
//  not a real value, undefined is returned.
//
//      n           selection, integer
//      choiceN     value to return, if selected
//
//  eg. select(0, "False", "True") == "False"
//      select(1, "False", "True") == "True"
	if (!is_real(argument[0])) return undefined;
    return argument[clamp(argument[0] + 1, 1, argument_count - 1)];
}

function select_index() {
//  Returns the index of an argument matching a given value.
//  If value matches the first choice, 0 is returned.
//  if value isn't among the choices, undefined is returned.
//
//      value       value to find
//      choiceN     values to search
//
//  eg. select_index("two", "zero", "one", "two", "three") == 2
    var value = argument[0];
    var choices = ds_list_create();
    var result = undefined;
    for (var i = 1; i < argument_count; i++) ds_list_add(choices, argument[i]);
    i = ds_list_find_index(choices, value);
    if (i >= 0) result = i;
    ds_list_destroy(choices);
    return result;
}

function select_relative() {
//  Returns an argument in a position relative to a given value.
//  If a relative position is beyond the range of given choices,
//  the position is clamped to be within range. If current value
//  isn't among the choices, the return value is undefined.
//
//      current     value matching a given choice
//      delta       relative position of desired choice, integer
//      choiceN     value to return, if selected
//
//  eg. select_relative("Name", -2, "Hello", "Doctor", "Name") == "Hello"
//      select_relative("Doctor", 2, "Hello", "Doctor", "Name") == "Name"
    var current = argument[0];
    var delta = argument[1];
    var size = argument_count - 2;
    var choices = ds_list_create();
    var result = undefined;
    for (var i = 2; i < argument_count; i++) ds_list_add(choices, argument[i]);
    i = ds_list_find_index(choices, current);
    if (i >= 0) {
        i = clamp(i + delta, 0, size - 1);
        var result = ds_list_find_value(choices, i);
    }
    ds_list_destroy(choices);
    return result;
}

function select_relative_wrap() {
//  Returns an argument in a position relative to a given value.
//  If a relative position is beyond the range of given choices,
//  the position is wrapped until it is within range. If current
//  value isn't among the choices, the return value is undefined.
//
//      current     value matching a given choice
//      delta       relative position of desired choice, integer
//      choiceN     value to return, if selected
//
//  eg. select_relative_wrap("Name", -2, "Hello", "Doctor", "Name") == "Hello"
//      select_relative_wrap("Name", 2, "Hello", "Doctor", "Name") == "Doctor"
    var current = argument[0];
    var delta = argument[1];
    var size = argument_count - 2;
    var choices = ds_list_create();
    var result = undefined;
    for (var i = 2; i < argument_count; i++) ds_list_add(choices, argument[i]);
    i = ds_list_find_index(choices, current);
    if (i >= 0) {
        i = (((i + delta) mod size) + size) mod size;
        result = ds_list_find_value(choices, i);
    }
    ds_list_destroy(choices);
    return result;
}
