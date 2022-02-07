function PlayerCombat(_player, _stabAnimation, _shieldAnimation) {
	currentState = _player.isFighting;
	
	if (mouse_check_button_pressed(mb_left) && !_player.animationInterrupt) {
		_player.sprite_index = _stabAnimation;
		_player.image_index = 0;
		
		_player.animationInterrupt = true;
		_player.animationInterruptTime = 0.6;
		
		return true;
	}
	
	if (mouse_check_button_pressed(mb_right) && !_player.animationInterrupt) {
		_player.sprite_index = _shieldAnimation;
		_player.image_index = 0;
		
		if (_player.image_index == _player.image_number - 1) {
			_player.image_speed = 0;
		}
		
		_player.animationInterrupt = true;
		_player.animationInterrupted = true; // Skips the interrupt check
		
		return true;
	}
	
	if (mouse_check_button_released(mb_right)) {
		_player.animationInterrupt = false;
		_player.animationInterrupted = false;
			_player.image_speed = 1;
		
		return false;
	}
	
	// pass through state
	return currentState;
}