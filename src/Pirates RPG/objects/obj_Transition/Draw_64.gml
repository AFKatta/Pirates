/// Drawing the Transition's GUI
//if (type == TRANS_TYPE.SLIDE)
//{
//	draw_set_color(c_black);	
//	draw_rectangle(0,0,width,percent * heightHalf, false);
//	draw_rectangle(0,height, width, height - (percent * heightHalf), false);
//}
//
//if (type == TRANS_TYPE.FADE)
if(mode != 0)
{
	draw_set_color(c_black);
	draw_set_alpha(percent);
	draw_rectangle(0,0,width,height,false);
	draw_set_alpha(1);
}