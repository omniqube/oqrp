//Add score
//Score is only sent if score is higher than prev score
if(prevscore<score)
{
    if(gj_user_isloggedin())
    {
        //Send user score
        httprequest[0]=gj_scores_add("11773",string(score)+" points",score,"Some extra data here.")
        prevscore=score
    }
    else
    {
        //Send guest score, but first get guest name
        asyncdialog[2]=get_string_async("Please enter a name to send score.","")
        
    }
}

