BoardList = -1;

function LeaderboardsFetched(Success, DataList, ErrorMessage) {
	if(Success) {
		BoardList = DataList //We're not deleting the data list in this case because we're keeping it to display the leaderboards
	}
}

alarm[1] = 1 //I've notced a strange issue where calling gj functions as soon as the game starts will work, but the data will just be deleted one frame later for some reason. I'm not sure if this is a me issue or a gamemaker issue but easy work around for now.