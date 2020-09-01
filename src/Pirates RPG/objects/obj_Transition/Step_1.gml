/// @desc Progress Transition
// ><
//
//with (obj_Player) state = PlayerStateTransition;
//
//if (leading == OUT)
//{
//	percent = min(1, percent + TRANSITION_SPEED);	
//	if (percent >= 1) //If screen fully obscured
//	{
//		room_goto(target);
//		leading = IN;
//	}
//}
//else //leading == IN
//{
//	percent = max(0, percent - TRANSITION_SPEED);
//	if (percent <= 0) //If screen fully revealed
//	{
//		with (obj_Player) state = PlayerStateFree;
//		instance_destroy();	
//	}	
//}