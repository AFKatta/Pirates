/// @description Insert description here
// You can write your code in this editor
// ><

// Inherit the parent event
var anim_length = 9;
var frame_size = 64;
var anim_speed = 12;



draw_sprite_part(spr_body_tanned_male, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, x, y);

//INCREMENT FRAME FOR ANIMATION

if( x_frame < anim_length -1) {x_frame += anim_speed/60;}
else {x_frame = 0;}