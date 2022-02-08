/// @description 

//FOR DIALOGUE ENGINE
if instance_exists(textbox) {
	if distance_to_point(mouse_x,mouse_y)<1 {
		with(textbox) {
			selected = "option1";
		}
	}

	if textbox.options_show = false {
		instance_destroy();
	}

	if textbox.mode = "box" {
		sprite_set_offset(example_option_rect,299,0);
	}else{
		sprite_set_offset(example_option_rect,150,0);
	}
}/*else //Uncomment this if you are using cutscene engine too

//FOR CUTSCENE ENGINE
if instance_exists(cutscene_textbox) {
	if distance_to_point(mouse_x,mouse_y)<1 {
		with(cutscene_textbox) {
			selected = "option1";
		}
	}

	if cutscene_textbox.options_show = false {
		instance_destroy();
	}

	if cutscene_textbox.mode = "box" {
		sprite_set_offset(example_option_rect,299,0);
	}else{
		sprite_set_offset(example_option_rect,150,0);
	}
}*/else{
	instance_destroy();
}