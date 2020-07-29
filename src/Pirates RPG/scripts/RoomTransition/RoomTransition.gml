/// @desc RoomTransition(type, targetroom)
/// @arg Type
/// @arg TargetRoom

function RoomTransition(){

	if (!instance_exists(obj_Transition))
	{
		with(instance_create_depth(0,0,-8191, obj_Transition))
		{
			type = argument[0];
			target = argument[1];
		}
	}	
	else
	{
		show_debug_message("Trying to transition while a transition is already happening");	
	}
}