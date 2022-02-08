function SaberBotWander() {
	sprite_index = sprMove;

	//At destination or given up?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed) 
	{
		hSpeed = 0;
		vSpeed = 0;
		//End move animation
		sprite_index = sprIdle;
	
		//Set new target destination
		if (++wait >= waitDuration)
		{
			wait = 0;	
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45)
			xTo = x + lengthdir_x(enemyWanderDistance,dir)
			yTo = y + lengthdir_y(enemyWanderDistance,dir)
		}
	}
	else //move towards destination
	{
		timePassed++;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speedThisFrame,dir);
		vSpeed = lengthdir_y(_speedThisFrame,dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collide & move
		EnemyTileCollision();
	}
	
	if (++aggroCheck > aggroCheckDuration) {
		aggroCheck = 0;
		if instance_exists(GameManager.player) and point_distance(x, y, GameManager.player.x, GameManager.player.y) <= enemyAggroRadius {
			state = EnemyState.chase;
			target = GameManager.player;
		}
	}
}