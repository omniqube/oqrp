var xx = x
var yy = y 
var a = image_alpha

if(image_alpha < 1) { image_alpha += delta_time/1000000 }

if(Pop) {
	ShakeTime += (delta_time/1000000)*2
	
	xx += animcurve_channel_evaluate(ShakeX,ShakeTime)*5
	yy += animcurve_channel_evaluate(ShakeY,ShakeTime)*5
	
	a = animcurve_channel_evaluate(Alpha,ShakeTime)
	
	if(ShakeTime>1) {
		instance_destroy()
	}
}

Interest -= delta_time/1000000
if(Interest <= 0) {
	Interest = irandom_range(3,5)
	FloatDirection += random_range(-90,90)
	if(FloatDirection > 360) { FloatDirection -= 360 }
	if(FloatDirection < 0) { FloatDirection += 360 }
}

	GoToDirection += sign(FloatDirection-GoToDirection)

x += lengthdir_x(Speed,GoToDirection) //Yes I'm fully aware I named my variables backwards, leave me alone thx.
y += lengthdir_y(Speed,GoToDirection)

if(x+sprite_width/2 < 0) { x += room_width+sprite_width } if(x-sprite_width/2 > room_width) { x -= room_width+sprite_width } if(y+sprite_height/2 < 0) { y += room_height+sprite_height } if(y-sprite_height/2 > room_height) { y -= room_height+sprite_height }

draw_sprite_ext(sprite_index,image_index,xx,yy,image_xscale,image_yscale,image_angle,image_blend,a)