/// @description Insert description here
// You can write your code in this editor

var xx = x - x_offset;
var yy = y - y_offset;

if( flash != 0)
{
	shader_set(shWhiteFlash);
	shader_set_uniform_f(uFlash, flash);
}

	if(simpleSpriteDrawing == 0)
	{
		draw_sprite_ext(
			sprite_index,
			image_index,
			floor(xx),
			floor(yy-z),
			image_xscale,
			image_yscale,
			image_angle,
			image_blend,
			image_alpha
		)
	}
	else
	{
		ScriptExecuteArray(entityDrawingScript, entityActivateSprites);	
	}
	
if (shader_current() != -1) shader_reset();

//draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);