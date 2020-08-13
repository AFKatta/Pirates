/// @description Insert description here
// You can write your code in this editor

lerpProgress += (1 - lerpProgress) / 50;
textProgress += global.textSpeed;

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

//Cycle through responses
keyUp = keyboard_check_pressed(vk_up) 
keyDown = keyboard_check_pressed(vk_down) 
responseSelected += (keyDown - keyUp);
var _max = array_length_1d(responses)-1;
var _min = 0;
if (responseSelected > _max) responseSelected = _min;
if (responseSelected < _min) responseSelected = _max;

if( keyboard_check_pressed(vk_enter))
{
	var _messageLength = string_length(message);	
	if ( textProgress >= _messageLength)
	{
		if (responses[0] != -1)
		{
			with (originInstance)
			{
				DialogueResponses(other.responseScripts[other.responseSelected]);
			}
		}
		instance_destroy();
		if (instance_exists(obj_TextQueued))
		{
			with(obj_TextQueued) ticket --;
		}
		else{
			with(obj_Player) state = lastState;
		}
	}
	else
	{
		if ( textProgress > 2)
		{
			textProgress = _messageLength;	

		}	
	}
}


