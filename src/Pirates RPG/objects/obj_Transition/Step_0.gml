/// @description Insert description here
// You can write your code in this editor

if (mode != 0)
{
    if (mode == 4)
        percent = max(0, (percent - max((percent / 25), 0.005)));
    else
        percent = min(1.05, (percent + max(((1.1 - percent) / 25), 0.005)));
    if ((percent == 1.05) || (percent == 0))
    {
        switch mode
        {
            case 4:
                mode = 0;
                with (obj_Player)
                    lockPlayer = 0;
                break;
            case 1:
                mode = 4;
                room_goto_next();
                break;
            case 2:
                mode = 4;
                room_goto(target);
                break;
            case 3:
                game_restart();
                break;
        }
        
    }
}