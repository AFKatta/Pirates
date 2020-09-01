// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SkeletonAttackSlash(){

	var _spd = enemySpeed;
	var _activeSprite = sprite_index;
	if (image_index < 2)
	    _spd = 0;
	if ((floor(image_index) == 3) || (floor(image_index) == 5))
	    image_speed = 0;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if ((_distanceToGo < 4) && (image_index < 5))
	    image_speed = 1;
	if (_distanceToGo > _spd)
	{
	    dir = point_direction(x, y, xTo, yTo);
	    hSpeed = lengthdir_x(_spd, dir);
	    vSpeed = lengthdir_y(_spd, dir);
	    if (hSpeed != 0)
	        image_xscale = sign(hSpeed);
	    if (EnemyTileCollision() == 1)
	    {
			//HurtPlayer();
	        xTo = x;
	        yTo = y;
	    }
	}
	else
	{
	    x = xTo;
	    y = yTo;
	    if (floor(image_index) == 5)
	    {
	        stateTarget = ENEMYSTATE.CHASE;
	        stateWaitDuration = 15;
	        state = ENEMYSTATE.WAIT;
	    }
	}	
}