/// @description Insert description here
// You can write your code in this editor

if(keyboard_check_pressed(ord("I")))
{
	show_inventory = !show_inventory;	
}

if(!show_inventory) exit;

#region Mouse Slot
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size + x_buffer)*scale;
var cell_ybuff = (cell_size + y_buffer)*scale;

var i_mousex = mousex - slots_x - 12;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

var mouse_in_inventory = true;
if ( nx >= 0 and nx < inv_slots_width and ny >= 0 and ny < inv_slots_height)
{
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_xbuff);
	
	if((sx < cell_size*scale) and (sy < cell_size*scale))
	{
	m_slotx = nx;
	m_sloty = ny;
	}
}else
{
	mouse_in_inventory = false;	
}

//Set Selected Slot to Mouse Position
selected_slot = min(inv_slots-1,m_slotx + (m_sloty*inv_slots_width));
#endregion

// Pickup Item

var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];

if(pickup_slot != -1)
{
	if(mouse_check_button_pressed(mb_left))
	{
		//Drop Item into Game World (with mouse)
		if(!mouse_in_inventory)
		{	
			var pitem = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, pickup_slot] -= 1;
			
			//destroy itemin inventory if it was the last one
			if(inv_grid[# 1, pickup_slot] == 0)
			{
				inv_grid[# 0, pickup_slot] = item.none;
				pickup_slot = -1;
			}
			
			//var _items = inv_grid[#  1, pickup_slot];
			//
			////fragmentArray = array_create(_items, obj_Item);
			////DropItem(obj_Player.x,obj_Player.y,fragmentArray);
			//
			//
			//var _anglePerItem = 360/_items;
			//var _angle = random(360);
			//
			//for (var i = 0; i < _items; i ++)
			//{
			//with(instance_create_layer(obj_Player.x, obj_Player.y, "Instances", obj_Item))
			//{
			//	direction = _angle;
			//	spd = 0.75 + (_items * 0.1) + random (0.1);
			//}
			//_angle += _anglePerItem;
			//}
			
			//create the item
			var inst = instance_create_layer(obj_Player.x, obj_Player.y, "Instances", obj_Item);	
			with(inst)
			{
				item_num = pitem;				
				//DropItem(x, y, pitem);
				x_frame = item_num mod (spr_width/cell_size);
				y_frame = item_num div (spr_width/cell_size);
			}
			show_debug_message("Dropped an item.");
		}
		else if(ss_item == item.none)
		{
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = item.none;
			inv_grid[# 1, pickup_slot] = 0;
			
			pickup_slot = -1;
		
		}else if (ss_item == inv_grid[# 0, pickup_slot])
		{
			if(selected_slot != pickup_slot)
			{
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];		
				inv_grid[# 0, pickup_slot] = item.none;
				inv_grid[# 1, pickup_slot] = 0;
			}
			
			pickup_slot = -1;
		}else
		{
			var ss_item_num = inv_grid[# 1, selected_slot];
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			
			inv_grid[# 0, pickup_slot] = ss_item;
			inv_grid[# 1, pickup_slot] = ss_item_num;
			
			pickup_slot = -1;
		}
	}
}
else if(ss_item != item.none)
{
	//Drop Item into Game World
	if (mouse_check_button_pressed(mb_right))
	{
		inv_grid[# 1, selected_slot] -= 1;
		//destroy itemin inventory if it was the last one
		if(inv_grid[# 1, selected_slot] == 0)
		{
			inv_grid[# 0, selected_slot] = item.none;
		}
		
		//create the item
		var inst = instance_create_layer(obj_Player.x, obj_Player.y, "Instances", obj_Item);	
		with(inst)
		{
			item_num = ss_item;
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);
		}
		show_debug_message("Dropped an item.");
	}
	
	//Drop Pickup Item into new Slot
	if(mouse_check_button_pressed(mb_left))
	{
		pickup_slot = selected_slot;
		
	}
}