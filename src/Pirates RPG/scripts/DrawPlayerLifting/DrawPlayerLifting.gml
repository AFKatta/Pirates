// Script assets have changed for v2.3.0 see
// ><

function DrawPlayerLifting(){

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

	//DRAW THE LIFTING ANIMATION FRAME 1
	draw_sprite_part(spr_complete_character, 0, floor(_xFrame)*_frameSize, _yFrame*_frameSize, 64, 64, x, y);
	
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
//}

}

/// @arg id
function ActivateLiftable(id){

	var _liftAnimation = 2;

	if(global.iLifted == noone)
	{
		PlayerActOutAnimation(spr_pirate_idle);
		sprite_index = spr_explosive_barrell;
		global.iLifted = id;
		with(global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}
}