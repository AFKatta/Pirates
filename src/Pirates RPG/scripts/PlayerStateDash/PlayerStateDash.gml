// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateDash(){
	//Movement
	//inputDirection take a value based on the angle he is going. 0 is right, 90 is up, 180 left, 270 down
	spd = spd*4;
	
	hSpeed = lengthdir_x(inputMagnitude * spd, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * spd, inputDirection);

	if(hSpeed != 0 || vSpeed != 0)
	{
	PlayerCollision();
	}
	
	//Create the dash effect
	var dash = instance_create_depth(obj_Player.x, obj_Player.y, obj_Player-1, obj_DashEffect);
	dash.sprite_index = spr_player_dash; 
	dash.image_index = image_index;
}