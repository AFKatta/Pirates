/// @description Entity Loop
if (!global.gamePaused)
{
	//depth = -bbox_bottom;
	if (lifted) && (instance_exists(obj_Player) && obj_Player.hasLifted = 1)
	{
		//if (obj_Pirate.sprite_index != spr_complete_character)
		//{
		x = obj_Player.x -28;
		y = obj_Player.y -45;
		z = 30;
		depth = obj_Player.depth-20;
		//}
	}
	
	if (!lifted)
	{
		//Be Thrown
		if(thrown)	
		{
			throwDistanceTravelled = min(throwDistanceTravelled+3, throwDistance);
			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
			y = ystart + lengthdir_y(throwDistanceTravelled, direction);
			if(tilemap_get_at_pixel(collisionMap,x,y) > 0)
			{
				thrown = false;
				grav = 0.1;
			}
			
			throwPercent = throwStartPercent + lerp(0,1 - throwStartPercent, throwDistanceTravelled / throwDistance);
			z = throwPeakHeight * sin(throwPercent * pi);
			if(throwDistance == throwDistanceTravelled)
			{
				thrown = false;		
				var _entityList = ds_list_create();
				var _entityCount = instance_place_list(x, y, 5, _entityList, 0);
				var _entity = noone;
				while (_entityCount > 0)
				{
				    _entity = ds_list_find_value(_entityList, 0);
				    with (_entity)
				    {
				        if object_is_ancestor(object_index, par_Enemy)
				            {
							HurtEnemy(id, 5, other.id, 5);
							}
				        else if (entityHitScript != -1)
				            script_execute(entityHitScript);
				    }
				    ds_list_delete(_entityList, 0);
				    _entityCount--;
				}
				ds_list_destroy(_entityList);
				if(entityThrowBreak) instance_destroy();
			}
		}
		else
		{
			//Fall back to earth if above zero Z	
			if( z > 0)
			{
				z = max(z-grav, 0);
				grav += 0.1;
				if(z==0) && (entityThrowBreak) instance_destroy();
			}
			else
			{
				grav = 0.1;	
			}
		}
	}
	flash = max( flash-0.03, 0);
	//depth = (-y);
}

//flash = max( flash-0.03, 0);