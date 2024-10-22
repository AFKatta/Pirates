// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtPlayer(){
	if (obj_Player.invulnerable <= 0)
	{
		obj_Player.PlayerHealth = max(0, (obj_Player.PlayerHealth - argument2));
		if (obj_Player.PlayerHealth > 0)
		{
		    with (obj_Player)
		    {
		        state = PlayerStateHurt;
		        direction = argument0;
		        moveDistanceRemaining = argument1;
		        ScreenShake(2, 10);
		        flashShader = 1;
		        flash = 0.7;
		        invulnerable = 60;
		    }
		}
		else
		{
		    with (obj_Player)
		        state = PlayerStateDead;
		}
	}
}