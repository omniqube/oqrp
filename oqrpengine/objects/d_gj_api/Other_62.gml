//Check result id...
var resultid=gj_result_id();
//If this was the login request...
if(resultid==loginrequest)
{
    if(gj_result_status())
    {
        //Success! Now give user a trophy.
        gj_trophy_add("1409")
        //And init session too.
        gj_session_open()
        alarm[0]=30*room_speed //Ping every 30 seconds.
        //Let's check if user was logged in earlier.
        httprequest[2]=gj_datastore_get_user("logincount")
        httprequest[3]=gj_user_info_fromusername(gj_user_username())
        httprequest[4]=gj_trophy_get_id("1411")
    }
    else
    show_message_async(gj_result_error())
}
else if(resultid==httprequest[0]) //Score added to list (or failed...)
{
    if(gj_result_status())
    {
        //Success!
        show_message_async("You succesfully added your score to the list.")
        httprequest[1]=gj_scores_get("11773",1) //Get new highscore.
    }
    else
    show_message_async(gj_result_error())
}
else if(resultid==httprequest[1]) //If we just recieved the highscore. 
{
    if(gj_result_status())
    {
        highscorestring=gj_result_data_field("score")+" by "+gj_result_data_field("display_name") //Set highscore text.
        //If there were multiple highscores, the following code would return the 2nd highscore.
        //gj_result_data_field_num("score",1)
        //And you would be able to check how many highscores there are with:
        //gj_result_data_count()
    }
    else
    highscorestring="(error)"
}
else if(resultid==httprequest[2]) //Just recieved the login count
{
    var status=gj_result_status();
    if(status==1)
    {
        //User logged in already. Check login count and add 1 to the logincount.
        gj_datastore_update_user("logincount","1","add")
        //And check how many time the user logged in before.
        loggedontimes=real(gj_result_data_field("data"))
    }
    else if(status==0)
    {
        if(gj_result_error()="No item with that key could be found.")
        {
            //Item does not exists, so user didn't logon earlier. Set login to 1 time.
            gj_datastore_set_user("logincount","1")
        }
    }
}
else if(resultid==httprequest[3]) //If we just recieved user information.
{
    if(gj_result_status())
    {
        currusertype=gj_result_data_field("type") //Loading user type.
    }
}
else if(resultid==httprequest[4]) //If user is awesome (last trophy is achieved)
{
    if(gj_result_status())
    {
        if(gj_result_data_field("achieved")!="false") //Check if trophy is achieved.
        {
            userisawesome=true
            awesomesince=gj_result_data_field("achieved") //This now returns since when the user has the trophy.
        }
    }
}
gj_result_clear()

