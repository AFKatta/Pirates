/// @desc Cause a room transition
if (instance_exists(obj_Pirate)) && (position_meeting(obj_Pirate.x, obj_Pirate.y, id))
{
	global.targetRoom = targetRoom;	
	global.targetX = targetX;
	global.targetY = targetY;
	global.targetDirection = obj_Pirate.direction;
	room_goto(targetRoom);
	instance_destroy();
}