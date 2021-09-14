//Handle all dialogs in the game.
var i_d;
i_d=ds_map_find_value(async_load,"id");
if (i_d==asyncdialog[0]) //Username dialog closed
{
   if(ds_map_find_value(async_load,"status"))
   {
      if(ds_map_find_value(async_load,"result")!="")
      {
         uname=ds_map_find_value(async_load,"result");
         asyncdialog[1]=get_string_async("Please enter your GameJolt user token.","")
         asyncdialog[0]=-1
      }
   }
}
if (i_d==asyncdialog[1]) //Token dialog closed
{
   if(ds_map_find_value(async_load,"status"))
   {
      if(ds_map_find_value(async_load,"result")!="")
      {
         utoken=ds_map_find_value(async_load,"result");
         loginrequest=gj_user_login(uname,utoken)
      }
   }
}
if (i_d==asyncdialog[2]) //Get guest name dialog closed
{
   if(ds_map_find_value(async_load,"status"))
   {
      if(ds_map_find_value(async_load,"result")!="")
      {
         httprequest[0]=gj_scores_add_guest("11773",string(score)+" points",score,"Some extra data here.",ds_map_find_value(async_load,"result"))
         prevscore=score
      }
   }
}

