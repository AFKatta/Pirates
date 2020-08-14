// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerThrow(){

	with(global.iLifted)
	{
		lifted = false;
		persistent = false;
		thrown = true;
		z = 30;
		throwPeakHeight = z+20;
		throwDistance = 208//global.iLifted.entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercent = (z/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}

	global.iLifted = noone;
}