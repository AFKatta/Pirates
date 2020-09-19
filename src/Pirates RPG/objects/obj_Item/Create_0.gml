/// @description Insert description here
// You can write your code in this editor

event_inherited();

cell_size = 32;
item_spr = spr_Items;
spr_width = sprite_get_width(item_spr);
spr_height = sprite_get_height(item_spr);
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

item_num = -1;
x_frame = 0;
y_frame = 0;

x_offset = cell_size/2;
y_offset = cell_size*(2/3);

drop_move	= true;
var itemdir = irandom_range(0,359);
var len		= 100;
goal_x		= x + lengthdir_x(len, itemdir);
goal_y		= y + lengthdir_x(len, itemdir);