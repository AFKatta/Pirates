/// @description Insert description here
// You can write your code in this editor

depth = -1;
scale = 2;
cell_size = 32;
show_inventory = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_UI_Width = 288;
inv_UI_Height = 192;

spr_inv_UI = spr_Inventory;
spr_inv_items = spr_Items;

inv_slots = 17;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

x_buffer = 2;
y_buffer = 4;

spr_inv_items_colums = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_UI_x = ( gui_width * 0.5) - (inv_UI_Width * 0.5 * scale);
inv_UI_y = ( gui_height * 0.5) - (inv_UI_Height * 0.5 * scale);

info_x = inv_UI_x + (3 * scale);
info_y = inv_UI_y + (3 * scale);

slots_x = info_x;
slots_y = inv_UI_y + (40 * scale);

desc_x =  info_x + 12;
desc_y =  inv_UI_y + (156 * scale);

// Player Info

//0 = GOLD
//1 = SILVER
//2 = COPPER
//3 = NAME

ds_player_info = ds_grid_create(2,4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "";

ds_player_info[# 1, 0] = irandom_range(0,5);
ds_player_info[# 1, 1] = irandom_range(0,20);
ds_player_info[# 1, 2] = irandom_range(0,50);
ds_player_info[# 1, 3] = "Player";

// Inventory
// 0 = ITEM
// 1 = NUMBER

ds_inventory = ds_grid_create(2,inv_slots);

// Items
enum item {
	none		= 0,
	whitebag	= 1,
	yellowbag	= 2,
	woodlog		= 3,
	greenshield	= 4,
	silveraxe	= 5,
	copperaxe	= 6,
	goldenkey	= 7,
	silverkey	= 8,
	height		= 9,
}

#region Create Items Info Grid
ds_items_info = ds_grid_create(2, item.height);

//---Item Names
var z = 0, i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "White Bag";
ds_items_info[# z, i++] = "Yellow Bag";
ds_items_info[# z, i++] = "Wooden Log";
ds_items_info[# z, i++] = "Bleah";
ds_items_info[# z, i++] = "Silver Axe";
ds_items_info[# z, i++] = "Copper Axe";
ds_items_info[# z, i++] = "Golden Key";
ds_items_info[# z, i++] = "Silver Key";

//---Item Descriptions
z = 1; i = 0;
ds_items_info[# z, i++] = "Empty";
ds_items_info[# z, i++] = "Also known as the small bag";
ds_items_info[# z, i++] = "Also known as the average bag";
ds_items_info[# z, i++] = "The basic of any crafting";
ds_items_info[# z, i++] = "Bleah";
ds_items_info[# z, i++] = "Usually used to cut trees";
ds_items_info[# z, i++] = "Usually used to cut trees, badly.";
ds_items_info[# z, i++] = "Opens golden things";
ds_items_info[# z, i++] = "Opens silver things";

#endregion

ds_inventory[# 0, 0] = item.woodlog;
ds_inventory[# 1, 0] = 5;
ds_inventory[# 0, 1] = item.silveraxe;
ds_inventory[# 1, 1] = 1;
ds_inventory[# 0, 2] = item.woodlog;
ds_inventory[# 1, 2] = 7;
