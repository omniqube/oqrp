alarm[0] = 1*room_speed

if(BubblesPoppedSinceUpdate != 0) {
	GJDataUpdate("TotalGlobalPops","add",BubblesPoppedSinceUpdate,0,UpdateAttempt,-1)	
	BubblesPoppedSinceUpdate = 0
}