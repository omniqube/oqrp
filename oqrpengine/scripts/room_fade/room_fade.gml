function room_fade(target, time, fadecolor) {
	var _inst = instance_create_depth(0, 0, 0, fade)
	with (_inst) {
		targetRoom = target
		duration = time
		color = fadecolor
	}
}

function room_ramp(target, time, fadecolor) {
	var _inst = instance_create_depth(0, 0, 0, fade)
	with (_inst) {
		targetRoom = target
		duration = time
		color = fadecolor
		ramp = true
	}
}