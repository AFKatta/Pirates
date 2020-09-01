/// @description Insert description here
// You can write your code in this editor
z = 0;
flash = 0;
flashShader = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");
lifted = 0;
thrown = false;
//depth = (-bbox_bottom);
grav = 0.1;

if (entityUnique && ((global.iLifted != noone) && (global.iLifted.object_index == object_index)))
{
	instance_destroy();	
}

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);