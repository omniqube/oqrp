function runCommand(cmd) {

  var array = string_split(cmd, " ");
  if (string_length(array[0]) > 0)
  {
    //if (string_char_at(array[0], 1) == "/")
    //{
      //array[0] = string_delete(array[0], 1, 1);
	  scriptName = string_insert("_", array[0], 0)
	  for(i = array_length(array) - 2; i >= 0; i--){newarray[i] = array[i];}
	  var scriptAsset = asset_get_index(scriptName)
      if (script_exists(scriptAsset)) {
		  
		  compiledarray = array_create();
		  for (i = 1; i < array_length(array); i++) {compiledarray[i-1] = array[i]}
        commandResult = string(script_execute(scriptAsset, compiledarray));
		if (commandResult == 0) {commandResult = ""}
		
		}
      else {
        commandResult = "Unknown command."; }
   // }
	
  }
  push(commandResult);
  
}

function string_split(stri, delim) {
var s = stri, d = delim;
var rl = global.string_split_list;
var p = string_pos(d, s), o = 1;
var dl = string_length(d);
ds_list_clear(rl);
if (dl) while (p) {
    ds_list_add(rl, string_copy(s, o, p - o));
    o = p + dl;
    p = string_pos_ext(d, s, o);
}
ds_list_add(rl, string_delete(s, 1, o - 1));
// create an array and store results:
var rn = ds_list_size(rl);
var rw = array_create(rn);
for (p = 0; p < rn; p++) rw[p] = rl[|p];
return rw;
}
