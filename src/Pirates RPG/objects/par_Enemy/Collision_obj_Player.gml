/// @description Insert description here
// You can write your code in this editor

if (state = ENEMYSTATE.ATTACK)
{
HurtPlayer(point_direction(x, y, obj_Player.x, obj_Player.y), enemyForceTouch, enemyDamageTouch);
}