// Script assets have changed for v2.3.0 see
// ><

/// @arg id
function ActivateLiftable(){
	
	//state = PlayerStateLifting;

	if (global.iLifted == noone)
	{
	//with(obj_Pirate)
	//{
	//	sprite_index = spr_complete_character; 
	//	draw_sprite_part(sprite_index, 0, 0, 576, 64, 64, x, y);
		//draw_sprite(spr_complete_character, 0, x, y);
		//PlayerActOutAnimation();
	//}	//sprite_index = spr_explosive_barrell;
		global.iLifted = argument0;
		with(global.iLifted)
		{
			lifted = true;
			persistent = true;
		}
	}
}