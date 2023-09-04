function runCommand(cmd) {

  var carray = string_split(cmd, " ");
  if (string_length(carray[0]) > 0)
  {
    //if (string_char_at(array[0], 1) == "/")
    //{
      //array[0] = string_delete(array[0], 1, 1);
	  scriptName = string_insert("_", carray[0], 0)
	  for(i = array_length(carray) - 2; i >= 0; i--){newarray[i] = carray[i];}
	  var scriptAsset = asset_get_index(scriptName)
      if (script_exists(scriptAsset)) {
		  
		  compiledarray = array_create(array_length(carray));
		  for (i = 1; i < array_length(carray); i++) {compiledarray[i-1] = carray[i]}
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
