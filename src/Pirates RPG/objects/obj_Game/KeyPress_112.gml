/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(vk_f1)
{
    if (global.frameRate == 60)
        global.frameRate = 30;
    else
        global.frameRate = 60;
    game_set_speed(global.frameRate, 0);
}