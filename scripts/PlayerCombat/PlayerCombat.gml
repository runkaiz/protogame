function PlayerCombat(_player, _stabAnimation) {
	currentState = _player.isFighting;
	
	if (mouse_check_button_pressed(mb_left) && !_player.animationInterrupt) {
		_player.sprite_index = _stabAnimation;
		_player.image_index = 0;
		
		_player.animationInterrupt = true;
		_player.animationInterruptTime = 0.6;
		
		return true;
	}
	
	// pass through state
	return currentState;
}