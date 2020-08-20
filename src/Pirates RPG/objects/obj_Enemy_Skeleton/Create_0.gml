/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

sprMove = spr_Enemy_Skeleton_base_walking;
sprAttack = spr_Enemy_Skeleton_base_attack;
//sprHurt = spr_Enemy_Skeleton_base_die;
//sprDie = spr_Enemy_Skeleton_base_die;

//Enemy Functions
enemyScript[ENEMYSTATE.WANDER] = SkeletonWander;
enemyScript[ENEMYSTATE.CHASE] = SkeletonChase;
enemyScript[ENEMYSTATE.ATTACK] = SkeletonAttackSlash;
enemyScript[ENEMYSTATE.HURT] = SkeletonHurt;
enemyScript[ENEMYSTATE.DIE] = SkeletonDie;

