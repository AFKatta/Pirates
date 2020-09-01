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

    if lockPlayer
    {
        other.inputMagnitude = 0
        other.keyActivate = 0
    }
    switch state
    {
        case 0:
            PlayerStateFree();
            break;
        case 5:
            PlayerStateAct();
            break;
        case 1:
			PlayerStateAttack();
            //script_execute(attackScript[stateAttack])
            break;
        case 4:
            PlayerStateRoll();
            break;
        case 3:
            PlayerStateBonk();
            break;
        case 6:
            PlayerStateHurt();
            break;
        case 8:
            PlayerStateHook();
            break;
        case 7:
            PlayerStateDead();
            break;
    }

	if ((state != PlayerStateAttack) && ds_exists(hitByAttack, 2))
	{
        ds_list_destroy(hitByAttack);
	}
    if (state == PlayerStateDead)
	{
        depth = (-room_height);
	}
    else
    { 
		depth = (-bbox_bottom);
		flash = max((flash - 0.05), 0);
		invulnerable = max((invulnerable - 1), 0);
	}
	
//RESET MOVE VARIABLES
hSpeed = 0;
vSpeed = 0;

//INTENDED MOVEMENT
vSpeed = (input_down - input_up) * spd;
if(hSpeed == 0){ hSpeed = (input_right - input_left) * spd;}

if (!global.gamePaused) script_execute(state);
