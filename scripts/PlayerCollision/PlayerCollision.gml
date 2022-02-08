function PlayerCollision(initVelocity) {
	var _collision = false;

	//Horizontal Tiles
	if (tilemap_get_at_pixel(collisionMap, x + xVel, y))
	{
		x -= x mod TILE_SIZE;	
		if (sign(xVel) == 1) x += TILE_SIZE - 1;
		xVel = 0;
		_collision = true;
	}

	//Horizontal Move Commit
	x += xVel;

	//Vertical Tiles
	if (tilemap_get_at_pixel(collisionMap, x, y + yVel))
	{
		y -= y mod TILE_SIZE;	
		if (sign(yVel) == 1) y += TILE_SIZE - 1;
		yVel = 0;
		_collision = true;
	}

	//Vertical Move Commit
	y += yVel;

	return _collision;
}