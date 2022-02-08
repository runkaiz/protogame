/// Player movement script
/// arg0 = velocity
/// should be called in a step
function PlayerMovement(_initVelocity, _player, _idleAnimation, _runAnimation) {
    // Local vars & args
    velocity = _initVelocity;
    xVel = 0;
    yVel = 0;

    // check keyboard events
    isUp = keyboard_check(ord("W"));   
    isDown = keyboard_check(ord("S"));
    isRight = keyboard_check(ord("D"));
    isLeft = keyboard_check(ord("A"));    
    
    // Set x/y velocity based on direction of keys
    if (isUp) yVel = -1;
    if (isDown) yVel = 1;
    if (isRight) xVel = 1;
    if (isLeft) xVel = -1;
	
	// Set sprite orientation
	if (isRight) _player.image_xscale = 1;
	if (isLeft) _player.image_xscale = -1;

    // proposed new position
    newX = x + xVel * velocity;
    newY = y + yVel * velocity;
    // update position if free
    if (place_free(newX, newY)) {
        x = newX;
        y = newY;
    } else if (place_free(newX, y)) {
        x = newX; // update the x, if the y isn't free
    } else if (place_free(x, newY)) {
        y = newY; // update the y, if the x isn't free
    } else {
        // nothing free.
    }
	
	// Check if run animation should start or stop
	if (!_player.animationInterrupt) {
		if (xVel != 0 || yVel != 0) {
			_player.sprite_index = _runAnimation;
			return true;
		} else {
			_player.sprite_index = _idleAnimation;
			return false;
		}
	}
	
	return false;
}