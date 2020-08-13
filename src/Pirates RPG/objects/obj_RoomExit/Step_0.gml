/// @desc Cause a room transition
if (instance_exists(obj_Player)) && (position_meeting(obj_Player.x, obj_Player.y, id))
{
	if (!instance_exists(obj_Transition))
	{
		global.targetRoom = targetRoom;	
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = obj_Player.direction;
		with (obj_Player) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.FADE, targetRoom);
		instance_destroy();
	}
}