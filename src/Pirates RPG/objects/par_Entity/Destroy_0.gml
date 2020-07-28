/// @description Drop fragments & items
if (entityFragmentCount > 0)
{
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	DropItem(x,y,fragmentArray);
}