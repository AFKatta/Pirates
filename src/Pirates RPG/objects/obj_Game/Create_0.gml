/// @description Iniatilize & Globals
math_set_epsilon(0.0001);
randomize();

global.PlayerHealthMax = 5;
global.PlayerHealth = 3;
global.PlayerHasAnyItems = 0;
global.PlayerEquipped = 1;
global.PlayerMoney = 0;
global.PlayerAmmo = array_create(4, -1);
global.PlayerItemUnlocked = array_create(4, -1);
global.PlayerAmmo[1] = 0;
global.PlayerAmmo[2] = 0;
global.questStatus = ds_map_create();
//ds_map_set(global.questStatus, "ExampleQuestName", 0);
//ds_map_set(global.questStatus, "ExampleQuestName2", 0);
global.roofTileAlpha = 1;
//global.uRoofTileAlpha = shader_get_uniform(2, "alpha");
global.outdoorsAlpha = 0;
//global.uOutdoorsAlpha = shader_get_uniform(3, "alpha");
global.frameRate = 60;
//Global.TextSettings();
global.gamePaused = false;
global.textSpeed = 0.75;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = -1;
global.iLifted = -4;
surface_resize(application_surface, 1366, 768);
display_set_gui_size(1366, 768);
global.iTransition = instance_create_depth(0, 0, (depth - 1), obj_Transition);
//global.iUI = instance_create_layer(0, 0, layer, oUI);
gifRecord = 0;
GUI = surface_create(1366, 768);

global.iCamera = instance_create_layer(0,0,layer,obj_Camera);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);

