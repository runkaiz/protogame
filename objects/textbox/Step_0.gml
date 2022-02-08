/// @description Manage everything

if textbox_visible == true && backlog_visible == false {
	
	//If mouse enabled
	if mouse_enabled {
		if options_show = false {
			if mouse_check_button_pressed(mb_left) {
				keyboard_key_press(speak_key);
			}
			if mouse_check_button_released(mb_left) {
				keyboard_key_release(speak_key);
			}
			if mouse_check_button_pressed(mb_right) {
				keyboard_key_press(skip_key);
			}
			if mouse_check_button_released(mb_right) {
				keyboard_key_release(skip_key);
			}
		//Prevent dialogue from advancing if mouse is not pointing any option
		}else if mouse_on_option {
			if mouse_check_button_pressed(mb_left) {
				keyboard_key_press(speak_key);
			}	
			if mouse_check_button_released(mb_left) {
				keyboard_key_release(speak_key);
			}
			if mouse_check_button_pressed(mb_right) {
				keyboard_key_press(skip_key);
			}
			if mouse_check_button_released(mb_right) {
				keyboard_key_release(skip_key);
			}		
		}
		if instance_exists(option_object1) {
			with(option_object1) {
				if distance_to_point(mouse_x,mouse_y)<1 {
					textbox.mouse_on_option = true;
				}else with(option_object2) {
					if distance_to_point(mouse_x,mouse_y)<1 {
						textbox.mouse_on_option = true;
					}else with(option_object3) {
						if distance_to_point(mouse_x,mouse_y)<1 {
							textbox.mouse_on_option = true;
						}else{
							textbox.mouse_on_option = false;
						}
					}
				}
			}
		}
	}

	//Increase characters
	if (characters < message_length) {
		characters += increase;
	
		//Make sound
		if text_sound = true {
			if itstime = true {
				audio_sound_gain(textsound,text_sound_volume,0);
				audio_play_sound(textsound,1,false);
				itstime = false;
				alarm[0] = text_sound_interval;
			}
		}
	
		//Press skip key to skip dialogue
		if itstime2 {
			if keyboard_check_released(skip_key) {
				characters = message_length;
				//Delay to prevent accidental message skips
				itstime2 = false;
				alarm[1] = 5;
			}
		}
	
		//What has to be drawn right now
		message_draw = string_copy(message[message_current],0,characters);
	
	}else{
		//Press speak key to continue in the dialogue
		if keyboard_check_released(speak_key) {
			if message_current<message_end {
				if delay == false {
					message_current += 1;
					characters = 0;
					message_draw = "";
					message_length = string_length(message[message_current]);
					//Reset delay variables
					delay = true;
					itstime3 = true;
					//Update backlog
					texts_in_backlog ++;
					for (var i=0;i<texts_in_backlog;i++) {
						backlog[texts_in_backlog-i] = backlog[texts_in_backlog-i-1];
					}
					backlog[0] = message[message_current];
				}
			}
			//End dialogue if it is the last message
			else {
				if delay == false {
					message_current = 0;
					characters = 0;
					message_draw = 0;
					message_length = string_length(message[message_current]);
					if var_to_change != noone {
						variable_instance_set(var_object,var_to_change,var_value);
					}
					instance_destroy();
					
					//Update backlog here too?
				}
			}
		}
	}

	//Do a little delay to prevent accidentally skipping dialogue
	if characters>=message_length && delay = true && itstime3 = true {
		itstime3 = false;
		alarm[3] = room_speed/5;
	}

	///Options
	if options_set = true {
	
		//When to show options
		if message_current = show_options_when {
			options_show = true;
		}else{
			options_show = false;
		}

		//Change a message according to selected option
		if message_to_change != 0 {
			if selected = "option1" {
			    message[message_to_change] = ifoption1;
			}else{
			    if selected = "option2" {
			        message[message_to_change] = ifoption2;
			    }else{
			        if selected = "option3" {
			            message[message_to_change] = ifoption3;
			        }
			    }
			}
		}

	#region Working on this
	/*/If used options second time
	if options_set2 = true {

	//When to show options
	if message_current = show_options_when2 {
		optioncount = optioncount2;
	
		options_show2 = true;
	}else{
		options_show2 = false;
	}
	
	//Change a message according to selected option
	if message_current = show_options_when2 {
		if selected = "option1" {
			message[message_to_change2] = ifoptionsecond1;
		}else{
			if selected = "option2" {
				message[message_to_change2] = ifoptionsecond2;
			}else{
				if selected = "option3" {
					message[message_to_change2] = ifoptionsecond3;
				}
			}
		}
	}
	
	}



	//If used options third time
	if options_set3 = true {
	
	//When to show options
	if message_current = show_options_when3 {
		optioncount = optioncount3;
	
		options_show3 = true;
	}else{
		options_show3 = false;
	}

	//Change a message according to selected option
	if message_current = show_options_when3 {
		if selected = "option1" {
			message[message_to_change3] = ifoptionthird1;
		}else{
			if selected = "option2" {
				message[message_to_change3] = ifoptionthird2;
			}else{
				if selected = "option3" {
					message[message_to_change3] = ifoptionthird3;
				}
			}
		}
	}


	}*/
	#endregion

	}

	///Manage speed of text
	//This is only necessary if you want to change the speed of the text.
	if speed_set = true {
		increase = message_speed[message_current];
	}



	/*/If some of the option_show variables is true, make the first true
	if options_show2 = true || options_show3 = true {
		options_show = true;
	}*/

}

//Backlog
if backlog_visible {
	if mouse_wheel_down() && backlog_stop_down == false {
		backlog_position+=scroll_speed; //could change this amount to the current text height or something. or maybe not.
	}else if mouse_wheel_up() && backlog_stop_up == false {
		backlog_position-=scroll_speed;
	}
}