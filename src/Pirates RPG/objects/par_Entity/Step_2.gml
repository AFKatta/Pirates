/// @description Entity Loop
if (!global.gamePaused)
{
	depth = -bbox_bottom;
	if (lifted) && (instance_exists(obj_Pirate))
	{
		if (obj_Pirate.sprite_index != spr_pirate_idle)
		{
		x = obj_Pirate.x;
		y = obj_Pirate.y;
		z = 30;
		depth = obj_Pirate.depth-1;
		}
	}
	
}

flash = max( flash-0.03, 0);