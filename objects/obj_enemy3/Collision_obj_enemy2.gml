if (place_meeting(x, y, obj_enemy))
{
	for (var i = 0; i < 1000; ++i)
	{
		// right
		if (!place_meeting(x + i, y, obj_enemy))
		{
			x += i;
			break;
		}
		// left
		if (!place_meeting(x - i, y, obj_enemy))
		{
			x -= i;
			break;
		}
		
		// up
		if (!place_meeting(x, y - i, obj_enemy))
		{
			y -= i;
			break;
		}
		// down
		if (!place_meeting(x, y + i, obj_enemy))
		{
			y += i;
			break;
		}
		// top right
		if (!place_meeting(x + i, y - i, obj_enemy))
		{
			x += i;
			y -= i;
			break;
		}
		// top left
		if (!place_meeting(x - i, y - i, obj_enemy))
		{
			x -= i;
			y -= i;
			break;
		}
		// bottom right
		if (!place_meeting(x + i, y + i, obj_enemy))
		{
			x += i;
			y += i;
			break;
		}
		
		// bottom left
		if (!place_meeting(x - i, y + i, obj_enemy))
		{
			x -= i;
			y += i;
			break;
		}
	}
		
}