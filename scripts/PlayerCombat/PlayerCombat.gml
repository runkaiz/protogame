function PlayerCombat(_stabAnimation, _shieldAnimation) {
	currentState = disableMovement;
	
	if (mouse_check_button_pressed(mb_left) && !animationInterrupt) {
		sprite_index = _stabAnimation;
		image_index = 0;
		
		animationInterrupt = true;
		animationInterruptTime = 0.6;
		
		return true;
	}
	
	if (mouse_check_button_pressed(mb_right) && !animationInterrupt) {
		sprite_index = _shieldAnimation;
		image_index = 0;
		
		if (image_index == image_number - 1) {
			image_speed = 0;
		}
		
		animationInterrupt = true;
		animationInterrupted = true; // Skips the interrupt check
		
		return true;
	}
	
	if (mouse_check_button_released(mb_right)) {
		animationInterrupt = false;
		animationInterrupted = false;
		image_speed = 1;
		
		return false;
	}
	
	// pass through state
	return currentState;
}