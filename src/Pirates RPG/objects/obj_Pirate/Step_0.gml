/// @description Insert description here
// You can write your code in this editor

keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyActivate = keyboard_check_pressed(ord("Z"));
keyDig = keyboard_check_pressed(ord("D"));
keyAttack = keyboard_check_pressed(ord("A"));
keyItem = keyboard_check_pressed(vk_control);
keyTest = keyboard_check_pressed(ord("Q"));

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

if (!global.gamePaused) script_execute(state);

