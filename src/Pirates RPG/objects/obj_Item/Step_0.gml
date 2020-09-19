/// @description Insert description here
// You can write your code in this editor
// ><

if(drop_move)
{
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	if( abs(x - goal_x) < 1 and abs(y - goal_y) < 1) { drop_move = false; }
	
}
else
{
	//if(!keyboard_check(ord("E"))) exit;
	
	var px = obj_Player.x;
	var py = obj_Player.y;
	var r = 32;
	if (point_in_rectangle(px, py, x-r, y-r, x+r, y+r))
	{
		//ARE WE ON THE TOP OF THE PLAYER?
		r = 2;
		if( !point_in_rectangle(px, py, x-r, y-r, x+r, y+r))
		{
			//Move towards the player for pickup	
			x = lerp(x, px, 0.1);
			y = lerp(y, py, 0.1);
		}
		else
		{
			//Pickup Item
			var in = item_num;
			
			with(obj_Inventory)
			{
				var ds_inv = ds_inventory;
				var picked_up = false;
				
				//check if item exists in inventory already
				var yy = 0; repeat(inv_slots){
					if(ds_inv[# 0, yy] == in)
					{
						ds_inv[# 1, yy]	+= 1;				
						picked_up = true;
						break;
					} 
					else
					{
						yy += 1;
					}
				}
				
				//otherwise, add item to an empty slot if there is one
				if (!picked_up) 
				{
					yy = 0; repeat(inv_slots){
						if(ds_inv[# 0, yy] == item.none)
						{
							ds_inv[# 0, yy]	= in;
							ds_inv[# 1, yy]	+= 1;				
							picked_up = true;
							break;
						} 
						else
						{
							yy += 1;
						}
					}
				}	
			}
			
			//DESTROY ITEM IF PICKED_UP
			if(picked_up)
			{
				#region Create Notification
				if(!instance_exists(obj_Notification))
				{
					instance_create_layer(0, 0, "Instances", obj_Notification);
				}
				var in = item_num;
				with(obj_Notification)
				{
					if(!ds_exists(ds_notifications, ds_type_grid))
					{
						ds_notifications = ds_grid_create(2,1);
						var not_grid = ds_notifications;
						not_grid[# 0,0] = 1;
						not_grid[# 1,0] = obj_Inventory.ds_items_info[# 0, in];
					}
					else //Add to Grid
					{
							event_perform(ev_other, ev_user0);
						
							var not_grid = ds_notifications;
							var grid_height = ds_grid_height(not_grid);
							var name = obj_Inventory.ds_items_info[# 0, in];
							var in_grid = false;
							
							var yy = 0; repeat(grid_height)
							{
								if(name == not_grid[# 1, yy])
								{
									not_grid[# 0, yy] += 1;
									in_grid = true;
									break;
								}
								
								yy++;
							}
							
							if(!in_grid)
							{
								ds_grid_resize(not_grid, 2, grid_height + 1);	
								not_grid[# 0, grid_height] = 1;
								not_grid[# 1, grid_height] = obj_Inventory.ds_items_info[# 0, in];
							}
						}
				}
				#endregion
				
				instance_destroy();
				show_debug_message("Picked up an item.");
			}	
		}		
	}	
}