/// @description Example
//With this code here, you can set the contents of the dialogue in the creation code of the object, in the room
//So there is no need add do many objects, this one object coukd handle all your signboards
if instance_exists(example_player) {
	if keyboard_check_pressed(vk_space) {
		if place_meeting(x,y,example_player) {
			if !textbox_exists() {
				if array_length(text) = 1 {
					textbox_create(text[0]);
				}else if array_length(text) = 2 {
					textbox_create(text[0],text[1]);
				}else if array_length(text) = 3 {
					textbox_create(text[0],text[1],text[2]);
				}else if array_length(text) = 4 {
					textbox_create(text[0],text[1],text[2],text[3]);
				}else if array_length(text) = 5 {
					textbox_create(text[0],text[1],text[2],text[3],text[4]);
				}else if array_length(text) = 6 {
					textbox_create(text[0],text[1],text[2],text[3],text[4],text[5]);
				}
				textbox_set_bubble(noone,c_white,c_black,1,example_font,23,bubble_width,id);
			}
		}
	}
}