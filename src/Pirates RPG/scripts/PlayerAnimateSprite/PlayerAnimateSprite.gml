function PlayerAnimateSprite() {
	//Gives the correct Sprite image while moving
	if(sprite_get_number(sprite_index) >= 4)
	{
		var _totalFrames = sprite_get_number(sprite_index) / 4;
	}
	else
	{
		var _totalFrames = sprite_get_number(sprite_index);
	}
	image_index = localFrame + (CARDINAL_DIR *_totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

	//If animation would loop on next game step
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;	
	} else animationEnd = false;


}
