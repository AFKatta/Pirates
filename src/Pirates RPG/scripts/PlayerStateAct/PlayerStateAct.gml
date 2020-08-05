// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateAct(){

	//Update Sprite
	PlayerAnimateSprite();
	
	if(animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
		if (animationEndScript != -1)
		{
			//script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
}

/// @desc PlayerActOutAnimation(Number of Animation, EndScript)
/// @arg Sprite
/// @arg EndScript
function PlayerActOutAnimation(){
	
	//var _animType = -1;
	state = PlayerStateAct;
	sprite_index = argument[0];
	
	//switch(argument0)
	//{
	//	case 2: DrawPlayerLifting(); break;
	//	
	//	default: _animType = argument0;
	//}
	
	//state = PlayerStateAct;
	//sprite_index = argument0;
	if (argument_count > 1) animationEndScript = argument[1];
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();
	
}