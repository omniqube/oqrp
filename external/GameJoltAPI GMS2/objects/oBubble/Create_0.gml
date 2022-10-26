ShakeX = animcurve_get_channel(cBubblePop,"PopX")
ShakeY = animcurve_get_channel(cBubblePop,"PopY")
Alpha = animcurve_get_channel(cBubblePop,"Alpha")
ShakeTime = 0;
Pop = 0;

image_blend = make_color_hsv(random(255),255,200)
var scl = random_range(0.25,1)
image_xscale = scl
image_yscale = scl

image_alpha = 0

GoToDirection = random(360)
FloatDirection = random(360)
Interest = irandom_range(3,5)

Speed = random_range(3,5)