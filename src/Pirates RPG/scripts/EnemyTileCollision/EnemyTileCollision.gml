// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyTileCollision(){
	var _collision = 0
	if tilemap_get_at_pixel(collisionMap, (x + hSpeed), y)
	{
	    x -= x mod TILE_SIZE;
	    if (sign(hSpeed) == 1)  x += TILE_SIZE -1;
	    hSpeed = 0;
	    _collision = true;
	}
	x += hSpeed;
	
	var temp = y;
	if(sign(vSpeed) < 1) temp = temp - 20;
	if(tilemap_get_at_pixel(collisionMap, x, temp + vSpeed + sign(vSpeed)))
	{
		temp -= temp mod TILE_SIZE;
		if(sign(vSpeed) == 1) temp += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}
	y += vSpeed;
	
	return _collision;

}