var up, down, accept;

up			  = keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0, gp_padu);
down		  = keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0, gp_padd);
accept		  = keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_face1);

if up and image_index > 0 {
	image_index--;	
}

if down and image_index < image_number - 1 {
	image_index++;
}

if image_index == 2 and accept {
	game_end();	
}

if image_index == 1 and accept {
	room_goto(Options);
}

if image_index == 0 and accept {
	room_goto(Lobby);
}