function ScreenShake(argument0, argument1) {
	with (global.iCamera)
	{
		if(argument0 > shakeRemain)
		{
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		
		}
	}


}
