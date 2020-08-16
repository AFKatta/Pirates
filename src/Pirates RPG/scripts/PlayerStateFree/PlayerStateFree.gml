function PlayerStateFree() {
	//Movement
	//inputDirection take a value based on the angle he is going. 0 is right, 90 is up, 180 left, 270 down
	hSpeed = lengthdir_x(inputMagnitude * spd, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * spd, inputDirection);

	if(hSpeed != 0 || vSpeed != 0)
	{
	PlayerCollision();
	}

	if(keyDash)
	{
	state = PlayerStateDash;
	alarm[0] = room_speed/6;
	}

	//Update Sprite Index
	//var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
	direction = inputDirection;
	//	sprite_index = spriteWalk;
	} 
	//else sprite_index = spriteIdle;
	//if (_oldSprite != sprite_index) localFrame = 0;
	//
	////Update Image Index
	//PlayerAnimateSprite();

	//Attack key logic
	if (keyAttack)
	{
		attackList = 1;
		animationStart = 1;
		state = PlayerStateAttack;
		stateAttack = AttackSlash;		
	}

	//Change State
	if (keyDig)
	{
		state = PlayerStateDig;
	}

	//Activate Key logic
	if (keyActivate)
	{
		animationStart = 1;
		state = PlayerStateAct;
		//1. Check for an entity to activate
		//2. If there is nothing, or there is something, but it has no script
		//3. Otherwise, there is something and it has a script, Activate!
		//4. If the thing we activate is an NPC, make it face towards us!
		
		var _distanceActivate = 0;
		
		if(direction == 270)
		{
			_distanceActivate = 20;	
		}
		else if(direction == 90)
		{
			_distanceActivate = 40;	
		}
		
		var _activateX = x + lengthdir_x(40 + _distanceActivate, direction);
		var _activateY = y + lengthdir_y(40 + _distanceActivate, direction);
		var _activateSize = 12;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			par_Entity,
			false,
			true,
			_activateList,
			true
		);
		
		//if the first insance we find is either our lifted entity or it has no script: try the next one
		while (_entitiesFound > 0)
		{
			var _check = _activateList[| --_entitiesFound];	
			if (_check != global.iLifted) && (_check.entityActivateScript != -1)
			{
				activate = _check;
				break;
			}
		}
		
		ds_list_destroy(_activateList);
		//activate = instance_position(x+_activateX, y+_activateY, par_Entity);
	
		if (activate == noone) // or activate.entityActivateScript == -1)
		{
			if (global.iLifted != noone)
			{
				PlayerThrow();	
			}
			state = PlayerStateFree;
			animationStart = 0;
			//state = PlayerStateRoll; //Still to implement
			//moveDistanceRemaining = distanceRoll;
			message = "Ciao!";
		}
		else
		{

			//Activate the AI Entity		
			with(activate)
			{
				ScriptExecuteArray(entityActivateScript, entityActivateArgs);
			}
			//ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			
			if (activate.entityNPC)
			{
				with(activate)
				{
					direction = point_direction(x,y,other.x,other.y);
					image_index = CARDINAL_DIR;
				}
			}			
		}
	}
}
