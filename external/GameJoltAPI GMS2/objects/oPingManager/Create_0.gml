//This is a simple object to tell GameJolt that we're still in-game.
//This is intended to be just an example, you should build your own method of doing this for your own game.
//(however, if this works for you feel free to copy it over to your project)

RepingTimer = 1 //Ping per 1 seconds

Ping = 0;
PingGuessTimer = 0
PingResponse = 1;

depth = -10

function PingGuess(Success, ErrorMessage) {
	if(Success) {
		Ping = (Ping+PingGuessTimer)/2
		PingResponse = 1
	}
}