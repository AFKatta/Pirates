// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateAct(){

	//Update Sprite
	DrawPlayerLifting()
	
	if(animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
		if (animationEndScript != -1)
		{
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
}

/// @desc PlayerActOutAnimation(Sprite, EndScript)
/// @arg Sprite
/// @arg EndScript
function PlayerActOutAnimation(argument0, argument1){
	
	state = PlayerStateAct;
	sprite_index = argument0;
	if (argument_count > 1) animationEndScript = argument1;
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();
	
}