// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCornerAdjust(){
	if tilemap_get_at_pixel(collisionMap, (x + round(hSpeed)), y)
{
    var _aboveFree = (!tilemap_get_at_pixel(collisionMap, (x + round(hSpeed)), (y - adjustDistance)));
    var _belowFree = (!tilemap_get_at_pixel(collisionMap, (x + round(hSpeed)), (y + adjustDistance)));
    if (_aboveFree || _belowFree)
        vSpeed += (_belowFree - _aboveFree);
}
if tilemap_get_at_pixel(collisionMap, x, (y + round(vSpeed)))
{
    _aboveFree = (!tilemap_get_at_pixel(collisionMap, (x - adjustDistance), (y + round(vSpeed))));
    _belowFree = (!tilemap_get_at_pixel(collisionMap, (x + adjustDistance), (y + round(vSpeed))));
    if (_aboveFree || _belowFree)
        hSpeed += (_belowFree - _aboveFree);
}


}