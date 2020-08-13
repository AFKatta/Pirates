/// @description Entity Loop
if (!global.gamePaused)
{
	depth = -bbox_bottom;
	if (lifted) && (instance_exists(obj_Player))
	{
		//if (obj_Pirate.sprite_index != spr_complete_character)
		//{
		x = obj_Player.x -28;
		y = obj_Player.y -45;
		z = 30;
		depth = obj_Player.depth-2;
		//}
	}
	
}

flash = max( flash-0.03, 0);