//API example by Florian van Strien
//Init system
gj_init("11689","381e2309cf82106f3a1d67cbbfecbdc6")
//Some vars we need.
//You can skip this part.
asyncdialog[0]=-1
asyncdialog[1]=-1
asyncdialog[2]=-1
senttrophy[0]=false
senttrophy[1]=false
loggedontimes=0
uname=""
utoken=""
loginrequest=-1
httprequest[0]=-1
httprequest[1]=-1
httprequest[2]=-1
httprequest[3]=-1
httprequest[4]=-1
userisawesome=false
prevscore=0
currusertype="user"
highscorestring="(Loading)"
awesomesince="just now"


//Get the highscore.
httprequest[1]=gj_scores_get("11773",1)
//Try to login automatically
if(gj_user_autologin())
{
    //If succesfull, get and set some things.
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

