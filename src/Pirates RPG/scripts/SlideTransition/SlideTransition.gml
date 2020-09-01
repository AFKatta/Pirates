// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlideTransition(){
	with (global.iTransition)
	{
		if (mode == 0)
		{
		    with (obj_Player)
		    lockPlayer = 1
		    mode = argument[0]
		    if (argument_count > 1)
		        target = argument[1]
		}
		else
		    show_debug_message("Trying to transition while transition is happening!")
	}


}