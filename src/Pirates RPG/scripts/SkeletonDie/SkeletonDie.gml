// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SkeletonDie(){
	sprite_index = spr_Enemy_Skeleton_base_death;
	image_speed = 1;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed)
	{
	    dir = point_direction(x, y, xTo, yTo);
	    hSpeed = lengthdir_x(enemySpeed, dir);
	    vSpeed = lengthdir_y(enemySpeed, dir);
	    if (hSpeed != 0)
	        image_xscale = (-sign(hSpeed));
	    EnemyTileCollision();
	}
	else
	{
	    x = xTo;
	    y = yTo;
	}
	if ((image_index + (sprite_get_speed(sprite_index) / game_get_speed(0))) >= image_number)
	{
	    instance_destroy();
	    //DropItems(x, y, choose([31], [31, 31], [31, 31, 32], [33, 33], [33]));
	}


}