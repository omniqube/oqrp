loginAttempt = 0;
username = ""
password = ""

AchievedTrophyList = ds_list_create() //simple way of achieving the trophies once per game launch, realistically you should check what trophies the player already has once they login, but because this is a simple example I'm not going to.

randomize()

BubblesPopped = 0;
BubblesPoppedSinceUpdate = 0;
GlobalBubblesPopped = "Updating...";
totalClickAttempts = 0;


alarm[0] = 1*room_speed

audio_play_sound(aDream13,1,1)

function FetchAttempt(Success, Data, ErrorMessage) {
	if(Success) {
		GlobalBubblesPopped = Data
		show_debug_message("DataFetched "+string(Data))
	}
}

function UpdateAttempt(Success, ErrorMessage) {
	if(Success) {
		GJDataFetch("TotalGlobalPops",0,FetchAttempt,-1)
	}
}

function UserLoggedIn(Success, ErrorMessage) {
	if(Success) {
		GJSessionUpdate("open",-1,-1,-1); //Open a session since we're logged in
		instance_create_layer(0,0,layer,oPingManager) //create our ping manager (this is a really lazy method of ping control, you should actually make sure that your session is open first, but for the sake of examples this works)	
	} else {
		show_message_async("Failed! "+string(ErrorMessage))
	}
}

alarm[1] = 1 //I've notced a strange issue where calling gj functions as soon as the game starts will work, but the data will just be deleted one frame later for some reason. I'm not sure if this is a me issue or a gamemaker issue but easy work around for now.