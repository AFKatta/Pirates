/// @description Insert description here
// You can write your code in this editor
state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 4.0;
speedDigging = 0.5;
z = 0;

animationEndScript = -1;

spriteIdle = spr_pirate_stop;
spriteWalk = spr_pirate_movement;
spriteDig = spr_pirate_digging;
localFrame = 0;

if (global.targetX != -1)
{
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}
