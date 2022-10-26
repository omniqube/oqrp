RepingTimer -= delta_time/1000000
PingGuessTimer += delta_time/1000

if(RepingTimer <= 0 && PingResponse = 1) { // do not check the ping if the previous request was left unforfilled
	RepingTimer = 1
	
	if(GJGetLoginStatus() != "") {
		PingResponse = 0
		PingGuessTimer = 0; //This is a really lazy way of guessing the player's ping and you shouldn't do it :D
		GJSessionUpdate("Ping","Active",PingGuess,-1) //Ping that we're still vibin
	} else {
		instance_destroy() //Why do I even exist if we're not logged in???!?
	}
}