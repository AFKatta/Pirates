// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateHurt(){
	hSpeed = lengthdir_x(speedBonk, direction);
	vSpeed = lengthdir_y(speedBonk, direction);
	moveDistanceRemaining = max(0, (moveDistanceRemaining - speedBonk));
	var _collided = PlayerCollision();
	//sprite_index = sPlayerHurt
	image_index = floor((((direction div 45) + 1) * 0.5));
	z = (sin(((moveDistanceRemaining / distanceBonk) * 3.14159265358979)) * distanceBonkHeight);
	if (moveDistanceRemaining <= 0)
	{
    direction = ((image_index + 2) * 90);
    state = PlayerStateFree;
	}
}