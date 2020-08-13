/// @description Insert description here
// You can write your code in this editor

//character sprites
spr_body	= spr_body_tanned_male;
spr_eyes	= spr_eyes_blue_male;
spr_hair	= spr_bangs_blonde_male;
spr_torso	= spr_brown_longsleeve;
spr_legs	= spr_red_pants_male;
spr_feet	= spr_complete_empty;
spr_bandana = spr_bandana_red;
spr_belt	= spr_belt_white_cloath_male;
spr_attack_slash_animation = spr_animation_saber;

attackAnimationStart = 0;
attackList = 0;
anim_speed = 12;
anim_length = 9;
x_frame = 1;
y_frame = 8;
y_frame_direction = 0;
x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

isattacking = 0;

speedWalk = 2.0;
speedNormal = 3.0;
speedRun = 4.0;
spd = speedNormal;

hSpeed = 0;
vSpeed = 0;

state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
z = 0;

animationEndScript = -1;


if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}
