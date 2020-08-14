/// @description Insert description here
// You can write your code in this editor
z = 0;
flash = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");
lifted = 0;
thrown = false;

x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);