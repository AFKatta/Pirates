// Script assets have changed for v2.3.0 see
// ><

function DrawPlayerLifting(){

var _animLength = 5;
var _frameSize = 64;
var _animSpeed = 12;

_xFrame = 3;


	if(inputDirection < 90){ _yFrame = 7;}
	else if(inputDirection < 180 && inputDirection >= 90){ _yFrame = 4;}
	else if(inputDirection < 270 && inputDirection >= 180){  _yFrame = 5;}
	else  _yFrame = 6;


//DRAW THE LIFTING ANIMATION FRAME 1
draw_sprite_part(spr_complete_character, 0, floor(_xFrame)*_frameSize, _yFrame*_frameSize, 64, 64, x, y);

//DRAW FRAMES FOR ANIMATION
if (_xFrame < _animLength - 2){ _xFrame += _animSpeed/60; }
else if(_xFrame < _animLength)
{
	_xFrame = 4; 
	_yFrame = _yFrame - 4;
	_xFrame += _animSpeed/60;
}
else
{
	animationEnd = true;
}

}

/// @arg id
function ActivateLiftable(argument1){

	if(global.iLifted == noone)
	{
		PlayerActOutAnimation();
		global.iLifted = argument0;
		with(global.iLifted)
		{
			lifted = true;
			persisten = true;
		}
	}
}