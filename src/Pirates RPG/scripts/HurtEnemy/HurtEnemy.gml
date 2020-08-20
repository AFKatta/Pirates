// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtEnemy(){
	
	with (argument0)
	{
		if (state != ENEMYSTATE.HURT)
		{
		    enemyHP -= argument1;
		    flash = 1;
		    if (enemyHP <= 0)
		        state = ENEMYSTATE.DIE;
		    else
		    {
		        if (state != ENEMYSTATE.HURT)
		            statePrevious = state;
		        state = ENEMYSTATE.HURT;
		    }
		    image_index = 0;
		    if (argument3 != 0)
		    {
		        var _knockDirection = point_direction(x, y, argument2.x, argument2.y);
		        xTo = (x - lengthdir_x(argument3, _knockDirection));
		        yTo = (y - lengthdir_y(argument3, _knockDirection));
		    }
		}
	}
}