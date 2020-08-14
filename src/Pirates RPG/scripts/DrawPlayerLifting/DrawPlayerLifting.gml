// Script assets have changed for v2.3.0 see
// ><

function DrawPlayerLifting(){

sprite_index = spr_complete_character;
var _animLength = 5;
var _frameSize = 64;
var _animSpeed = 0.01;

var _xFrame = 3;
var _yFrame = 7;

//inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
//
//	if(inputDirection < 90){ _yFrame = 7;}
//	else if(inputDirection < 180 && inputDirection >= 90){ _yFrame = 4;}
//	else if(inputDirection < 270 && inputDirection >= 180){  _yFrame = 5;}
//	else  _yFrame = 6;

var _temp = _xFrame - 3;
//
//for ( var _temp = _xFrame - 3;  _temp <= _animLength; )
//{
with(obj_Pirate)
{
	//DRAW THE LIFTING ANIMATION FRAME 1
	//draw_sprite_part(sprite_index, 0, floor(_xFrame)*_frameSize, _yFrame*_frameSize, 64, 64, x, y);
	//DrawObjects(3, spr_body_tanned_male, spr_brown_shoes_male, spr_white_pants_male, spr_maroon_longsleeve, spr_eyes_blue_male, spr_bangslong_black_male);
	
	var surf;
	surf = surface_create(64, 64);
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	//draw_sprite_part(spr_body_light_male, 0, 0, 576, 64, 64, x, y);
	draw_sprite(spr_body_light_male, 0, x, y);
	var spr_custom = sprite_create_from_surface(surf, 0, 0, 64, 64, true, true, x, y);
	surface_reset_target();
	surface_free(surf);
	//sprite_index = draw_sprite_part(spr_body_light_male, 0, 0, 576, 64, 64, x, y);
	//sprite_index = sprite_create_from_surface(spr_body_light_male, 0, 576, 64, 64, true, true, 500, 500);
	sprite_index = spr_custom;
	PlayerAnimateSprite();
	
	if(_temp>=3 and _xFrame < 4){ _xFrame = 4; _yFrame = _yFrame - 4;} 
	//DRAW FRAMES FOR ANIMATION
	if (_temp < _animLength ){ _xFrame += _animSpeed/60; }	
	//if (i < _animLength - 2){ _xFrame = _xFrame + 1;  }
	else
	{
		animationEnd = true;
		_xFrame ++;
	}
	_temp = _xFrame;
	//animationEnd = true;
	//sprite_index = spr_pirate_stop;
}
//}

}

/// @arg id
function ActivateLiftable(){
	
	//state = PlayerStateLifting;

	if (global.iLifted == noone)
	{
	//with(obj_Pirate)
	//{
	//	sprite_index = spr_complete_character; 
	//	draw_sprite_part(sprite_index, 0, 0, 576, 64, 64, x, y);
		//draw_sprite(spr_complete_character, 0, x, y);
		//PlayerActOutAnimation();
	//}	//sprite_index = spr_explosive_barrell;
		global.iLifted = argument0;
		with(global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}
}