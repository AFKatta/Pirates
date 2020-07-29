/// @desc Cause a room transition
if (instance_exists(obj_Pirate)) && (position_meeting(obj_Pirate.x, obj_Pirate.y, id))
{
	if (!instance_exists(obj_Transition))
	{
		global.targetRoom = targetRoom;	
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = obj_Pirate.direction;
		with (obj_Pirate) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.FADE, targetRoom);
		instance_destroy();
	}
}