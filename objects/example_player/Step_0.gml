///@description Moving

//If not speaking
if !instance_exists(textbox) {

	//Move with arrow keys
	if keyboard_check(vk_up) || keyboard_check(ord("W")) {
		y -= 4;
	}
	if keyboard_check(vk_down) || keyboard_check(ord("S")) {
		y += 4;
	}
	if keyboard_check(vk_right) || keyboard_check(ord("D")) {
		x += 4;
	}
	if keyboard_check(vk_left) || keyboard_check(ord("A")) {
		x -= 4;
	}

	//Stop moving
	if keyboard_check_released(vk_up) || keyboard_check_pressed(ord("W")) {
		y += 0;
	}
	if keyboard_check_released(vk_down) || keyboard_check_pressed(ord("S")) {
		y += 0;
	}
	if keyboard_check_released(vk_right) || keyboard_check_pressed(ord("D")) {
		x += 0;
	}
	if keyboard_check_released(vk_left) || keyboard_check_pressed(ord("A")) {
		x += 0;
	}


}



//This does that the object is under others if they are in front of it.
//But if there is a textbox the object would be in front of it, so we disable this when textbox exists.
if !instance_exists(textbox) {
	depth = -y;
}else{
	depth = 0;
}