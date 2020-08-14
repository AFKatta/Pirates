/// @description Insert description here
// You can write your code in this editor

//UPDATE INPUT
if (state = PlayerStateFree or state = PlayerStateTransition){
input_left	= keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up    = keyboard_check(vk_up);
input_down  = keyboard_check(vk_down);
input_walk  = keyboard_check(vk_control);
input_run   = keyboard_check(vk_shift);
keyActivate = keyboard_check_pressed(ord("Z"));
keyDig = keyboard_check_pressed(ord("D"));
keyAttack = keyboard_check_pressed(ord("A"));
keyDash = keyboard_check_pressed(ord("S"));
keyItem = keyboard_check_pressed(vk_alt);
}

inputDirection = point_direction(0,0,input_right-input_left,input_down-input_up);
inputMagnitude = (input_right - input_left != 0) || (input_down - input_up != 0);

//ALTER SPEED
if ( input_walk or input_run)	
{ 
	spd = abs((input_walk*speedWalk) - input_run*speedRun);	
} else
{
	spd = speedNormal;
}

//RESET MOVE VARIABLES
hSpeed = 0;
vSpeed = 0;

//INTENDED MOVEMENT
vSpeed = (input_down - input_up) * spd;
if(hSpeed == 0){ hSpeed = (input_right - input_left) * spd;}

if (!global.gamePaused) script_execute(state);
