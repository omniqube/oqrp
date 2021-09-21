/// OQRP Engine GameJolt API Integration
// Scripts/oqrp/GameJoltAPI

if (!global.oqrp.gj.active) {instance_destroy();}
//GJInit(global.oqrp.gameid, global.oqrp.key, bool_to_bin(global.developerMode));

if (file_exists(working_directory + ".gj_credentials")) {}

AchievedTrophyList = ds_list_create();
loginAttempt = 0;
username = ""; // SET USERNAME HERE
password = ""; // SET PASSW/TOKEN HERE
pingManagerActive = false;

/* Attempt to Login
if(GJGetLoginStatus() = "") {loginAttempt = get_login_async("","");}
*/

function FetchAttempt(Success, Data, ErrorMessage) {
	if(Success) {

	}
}

function UpdateAttempt(Success, ErrorMessage) {
	if(Success) {

	}
}

function UserLoggedIn(Success, ErrorMessage) {
	if(Success) {
		GJSessionUpdate("open",-1,-1,-1); //Open a session since we're logged in
		GJPingManager()
	}
}

// PING MANAGER
function GJPingManager() {
	pingManagerActive = true;
	RepingTimer = 1 //Ping per 1 seconds

	Ping = 0;
	PingGuessTimer = 0
	PingResponse = 1;

	depth = -10

}

function PingGuess(Success, ErrorMessage) {
	if(Success) {
		Ping = (Ping+PingGuessTimer)/2
		PingResponse = 1
	}
}