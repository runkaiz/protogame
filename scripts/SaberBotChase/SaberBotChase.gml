function SaberBotChase() {
	sprite_index = sprMove;
	
	if instance_exists(target) {
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed) {
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		} else {
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		EnemyTileCollision();
	}
}