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
	//if (inputMagnitude != 0)
	//{
	direction = inputDirection;
	//	sprite_index = spriteWalk;
	//} else sprite_index = spriteIdle;
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
		
		var _activateX = lengthdir_x(40 + _distanceActivate, direction);
		var _activateY = lengthdir_y(40 + _distanceActivate, direction);
		activate = instance_position(x+_activateX, y+_activateY, par_Entity);
	
		if (activate == noone or activate.entityActivateScript == -1)
		{
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
		
			
		}
	
				//Make an npc face the player
				//if (activate.entityNPC)
				//{
				//		direction = point_direction(x,y,other.x,other.y);	
				//		image_index = CARDINAL_DIR;
				//	
				//}
	
	}
	
}
