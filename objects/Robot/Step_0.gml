/// @description Detect for player
scr_hunt_step(GameManager.player, wall_obj, 1, 360, 100);

if isHunting and not activating {
	activating = true;
	sprite_index = RobotWake;
	alarm[0] = room_speed * 0.5;
}

if state == 1 {
	sprite_index = RobotMove;
}