//Draw some text.
draw_set_font(fnt_standard)
if!(gj_user_isloggedin())
draw_text(2,2,string_hash_to_newline("Not logged on to GameJolt. Press G to log on."))
else
draw_text(2,2,string_hash_to_newline("Logged on as "+string(gj_user_username())+" (We've seen you "+string(loggedontimes)+" time(s) before). You are a "+string_lower(currusertype)+"."))
draw_text(2,20,string_hash_to_newline("Score: "+string(score)))
draw_text(2,38,string_hash_to_newline("Click on blocks to get points."))
draw_text(2,56,string_hash_to_newline("Press SPACE to send score."))
draw_text(2,74,string_hash_to_newline("Highscore: "+highscorestring))
if(gj_user_isloggedin())
{
    if(userisawesome)
    draw_text(2,92,string_hash_to_newline("You are awesome since "+awesomesince+"!"))
    else
    draw_text(2,92,string_hash_to_newline("You are not awesome yet (get 1000 points to be awesome)"))
}

