/// @description Insert description here
// You can write your code in this editor

var xx = x - 36;
var yy = y - 58;

if (state = PlayerStateFree)
{
anim_length = 9;
anim_speed = 12;
if	   (hSpeed < 0) y_frame = 9;
else if(hSpeed > 0) y_frame = 11;
else if(vSpeed < 0) y_frame = 8;
else if(vSpeed > 0) y_frame = 10;
else				x_frame = 0;

y_frame_direction = y_frame;

}
else
{
	
	if(attackAnimationStart = 1)
	{ 
		x_frame = 0;
		attackAnimationStart = 0;
		isattacking = 1;
	}
	
	anim_length = 6;
	anim_speed = 10;
	
	if(hSpeed == 0 and vSpeed == 0)
	{
	y_frame = y_frame_direction + 4;
	}else
	{
		if	   (hSpeed < 0) y_frame = 13;
		else if(hSpeed > 0) y_frame = 15;	
		else if(vSpeed < 0) y_frame = 12;
		else if(vSpeed > 0) y_frame = 14;
		else				x_frame = 0;	
	}
}

//INCREMENT FRAME FOR ANIMATION
if(x_frame + (anim_speed/FRAME_RATE) < anim_length)
{
x_frame += anim_speed/FRAME_RATE;
}
else
{
	x_frame = 1;
	if (isattacking = 1)
	{
		y_frame -= 4;
		y_frame_direction -=4;
		isattacking = 0;
		attackList = 0;
	}
}

//DRAW CHARACTER BODY
draw_sprite_part(spr_body, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);

//DRAW FEET
draw_sprite_part(spr_feet, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);
	
//DRAW LEGS
draw_sprite_part(spr_legs, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);
	
//DRAW SHIRT
draw_sprite_part(spr_torso, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);
	
//DRAW EYES
draw_sprite_part(spr_eyes, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);
	
//DRAW HAIR
draw_sprite_part(spr_hair, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);

//DRAW BANDANAS
draw_sprite_part(spr_bandana, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);

//DRAW BELT
draw_sprite_part(spr_belt, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);

if (state = PlayerStateAttack)
{
//DRAW SWORD ANIMATION
if(y_frame == 12)
{
	if(x_frame >= 5)
	{
		draw_sprite_part(spr_attack_slash_animation, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE + 20, FRAME_SIZE, xx, yy);
	}
	else
	{
		draw_sprite_part(spr_attack_slash_animation, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);
	}
}
else if(y_frame == 13)
{
	draw_sprite_part(spr_attack_slash_animation, 0, floor(x_frame)*FRAME_SIZE - 10, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx-10, yy);
}
else if (y_frame == 14)
{
	if(x_frame >= 4)
	{
	draw_sprite_part(spr_attack_slash_animation, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE + 5, FRAME_SIZE +17, FRAME_SIZE, xx, yy +5);
	}
	else
	{
	draw_sprite_part(spr_attack_slash_animation, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE , FRAME_SIZE, FRAME_SIZE + 2, xx, yy);	
	}
}
else if(y_frame == 15)
{
	if(x_frame >= 4 and x_frame < 5)
	{
		draw_sprite_part(spr_attack_slash_animation, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE + 5, FRAME_SIZE + 10, FRAME_SIZE, xx, yy +5);
	}
	else if(x_frame >= 5)
	{
		draw_sprite_part(spr_attack_slash_animation, 0, floor(x_frame)*FRAME_SIZE+10, y_frame*FRAME_SIZE + 5, FRAME_SIZE + 10, FRAME_SIZE, xx+10, yy +5);	
	}
	else
	{
		draw_sprite_part(spr_attack_slash_animation, 0, floor(x_frame)*FRAME_SIZE, y_frame*FRAME_SIZE, FRAME_SIZE, FRAME_SIZE, xx, yy);
	}
}

}

//draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);