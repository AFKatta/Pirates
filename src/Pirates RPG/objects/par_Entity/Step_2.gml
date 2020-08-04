/// @description Entity Loop
if (!global.gamePaused)
{
	depth = -bbox_bottom;
	if (lifted) && (instance_exists(obj_Pirate))
	{
		x = obj_Pirate.x;
		y = obj_Pirate.y;
		z = 45;
		depth = obj_Pirate.depth-1;
	}
	
}

flash = max( flash-0.03, 0);