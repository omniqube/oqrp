
var gName = "";
if(GJGetLoginStatus() = "") { gName = "GuestUser" }
GJScoreFetch("",10,"","",gName,LeaderboardsFetched,-1) //request the top 10 scores on the default scoreboard, as a guest if not logged in.
