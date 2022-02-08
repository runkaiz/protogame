/// Player movement script
/// arg0 = velocity
/// should be called in a step
function PlayerMovement(_initVelocity, _idleAnimation, _runAnimation) {
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
    if (isUp) yVel = -1 * _initVelocity;
    if (isDown) yVel = 1 * _initVelocity;
    if (isRight) xVel = 1 * _initVelocity;
    if (isLeft) xVel = -1 * _initVelocity;
	
	// Set sprite orientation
	if (isRight) image_xscale = 1;
	if (isLeft) image_xscale = -1;

	PlayerCollision(velocity);
	
	// Check if run animation should start or stop
	if (!animationInterrupt) {
		if (xVel != 0 || yVel != 0) {
			sprite_index = _runAnimation;
			return true;
		} else {
			sprite_index = _idleAnimation;
			return false;
		}
	}
	
	return false;
}