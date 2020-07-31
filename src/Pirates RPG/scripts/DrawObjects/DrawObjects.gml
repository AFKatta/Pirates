// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawObjects(argument0, argument1, argument2, argument3, argument4, argument5, argument6){
	
	var _direction = 0;
	//x_offset =sprite_get_xoffset(mask_index);
	//y_offset =sprite_get_yoffset(mask_index);
	//var xx = x - x_offset;
	//var yy = y - y_offset;
	//x = xx;
	//y = yy;
	
	//argument0 is the direction we want the character to face: 0 right, 1 up, 2 left, 3 down
	switch(argument0)
	{
		case 0: _direction = 704; break;	
		
		case 1: _direction = 512; break;
		
		case 2: _direction = 576; break;
		
		case 3: _direction = 640; break;
		
		default: show_error("The value inserted for the direction is not valid", false);
	}
	
	//DRAW BODY
	draw_sprite_part(argument1, 0, 0, _direction, 64, 64, x, y);
	
	//DRAW FEET
	draw_sprite_part(argument2, 0, 0, _direction, 64, 64, x, y);
	
	//DRAW LEGS
	draw_sprite_part(argument3, 0, 0, _direction, 64, 64, x, y);
	
	//DRAW SHIRT
	draw_sprite_part(argument4, 0, 0, _direction, 64, 64, x, y);
	
	//DRAW EYES
	draw_sprite_part(argument5, 0, 0, _direction, 64, 64, x, y);
	
	//DRAW HAIR
	draw_sprite_part(argument6, 0, 0, _direction, 64, 64, x, y);
}