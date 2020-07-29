function AttackSlash(){	
	
	//Attack just Started
	if (sprite_index != spr_pirate_attack)
	{
		//Set up correct animation
		sprite_index = spr_pirate_attack;
		localFrame = 0;
		image_index = 0;
		
		//Clear hit list
		if(!ds_exists(hitByAttack, ds_type_list))
		{
			hitByAttack = ds_list_create();	
		}		
		ds_list_clear(hitByAttack);
		
	}
	
	CalcAttack(spr_pirate_attack_HB);
	//Update Sprite
	PlayerAnimateSprite();
	
	if (animationEnd)
	{
			state = PlayerStateFree;
			animationEnd = false;
	}
}

//Use attack hitbox & Check for hits
function CalcAttack(argument0){
	mask_index = argument0;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,par_Entity,hitByAttackNow,false);
	if (hits>0)
	{
		for(var i = 0; i < hits; i++)
		{
			//If this instance has not yet been hit by this attack, hit it!
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					if(entityHitScript != -1) script_execute(entityHitScript);	
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = spr_pirate_idle;
}