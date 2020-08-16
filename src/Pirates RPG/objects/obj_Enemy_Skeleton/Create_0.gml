/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMove = spr_Enemy_Skeleton_base_walking;

//Enemy Functions
enemyScript[ENEMYSTATE.WANDER] = SkeletonWander;
enemyScript[ENEMYSTATE.CHASE] = SkeletonChase;