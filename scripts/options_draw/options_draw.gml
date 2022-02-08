///@description options_draw
///@arg TextColour
///@arg SelectedTextColour
///@arg Font
///@arg option1
///@arg option2
///@arg option3
///Draws the options
function options_draw() {
	
	#region Variables
	
		smaller = 0; //This can be used to quickly change the position of everything
	
		if view_enabled == true && position_set == false {
			var option_x = camera_get_view_x(view_camera[view_current])+(camera_get_view_width(view_camera[view_current])-20);
			var option_y = camera_get_view_y(view_camera[view_current])+(camera_get_view_height(view_camera[view_current])-140);
		}else if position_set == false {
			var smaller = 0;
			var option_x = room_width-20;
			var option_y = room_height;
		}else{
			var option_x = x2-20;
			var option_y = room_height;
		}
	
		var textcolor = argument[0];
		var selectedcolor = argument[1];
		var fontt = argument[2];
	
	#endregion


	//If there are options
	if argument_count >= 4 {


		#region Check how many options there are

			//Count options
			if argument_count == 6 {
				var option_count = 3;
				var opt1 = argument[3];
				var opt2 = argument[4];
				var opt3 = argument[5];
				var opt1_w = string_width(opt1);
				var opt2_w = string_width(opt2);
				var opt3_w = string_width(opt3);
				var opt_w = max(opt1_w,opt2_w,opt3_w);
			}else
			if argument_count == 5 {
				var option_count = 2;
				var opt1 = argument[3];
				var opt2 = argument[4];
				var opt1_w = string_width(opt1);
				var opt2_w = string_width(opt2);
				var opt_w = max(opt1_w,opt2_w);
			}else
			if argument_count == 4 {
				var option_count = 1;
				var opt1 = argument[3];
				var opt_w = string_width(opt1);
			}else{
				var option_count = 0;
			}

		#endregion


		#region Draw the options
			
			//Set things
			
			//Font
			draw_set_font(fontt);
			//Halign
			draw_set_halign(fa_right);
			//Text height
			var opt_h = string_height(opt1);
			
			
			//Draw option 1
			
			//Position
			if option_count == 3 {
				var oy = option_y-opt_h*3+smaller;
			}else
			if option_count == 2 {
				var oy = option_y-opt_h*2+smaller;
			}else
			if option_count == 1 {
				var oy = option_y-opt_h+smaller;
			}
			
			//Colour & rectangle if selected
			if selected == "option1" {
				//Rectangle
				draw_set_colour(textcolor);
				draw_roundrect(option_x-opt_w,oy,option_x,oy+opt_h,false);
				//Colour
				draw_set_colour(selectedcolor);
			}else{
				draw_set_colour(textcolor);
			}
			
			//Text
			draw_text(option_x,oy,opt1);

			//If mouse enabled
			if mouse_enabled {
				if !instance_exists(option_object1) {
					instance_create_layer(option_x,oy,"hud",option_object1);
				}
			}


			//Draw option 2
			if option_count >= 2 {
				
				//Position
				if option_count == 3 {
					var oy = option_y-opt_h*2+smaller;
				}else
				if option_count == 2 {
					var oy = option_y-opt_h+smaller;
				}
				
				//Colour & rectangle if selected
				if selected == "option2" {
					//Rectangle
					draw_set_colour(textcolor);
					draw_roundrect(option_x-opt_w,oy,option_x,oy+opt_h,false);
					//Colour
					draw_set_colour(selectedcolor);
				}else{
					draw_set_colour(textcolor);
				}
				
				//Text
				draw_text(option_x,oy,opt2);
	
				//If mouse enabled
				if mouse_enabled {
					if !instance_exists(option_object2) {
						instance_create_layer(option_x,oy,"hud",option_object2);
					}
				}
			}


			//Draw option 3
			if option_count == 3 {
				
				//Position
				var oy = option_y-opt_h+smaller;
				
				//Colour & rectangle if selected
				if selected == "option3" {
					//Rectangle
					draw_set_colour(textcolor);
					draw_roundrect(option_x-opt_w,oy,option_x,oy+opt_h,false);
					//Colour
					draw_set_colour(selectedcolor);
				}else{
					draw_set_colour(textcolor);
				}
				
				//Text
				draw_text(option_x,oy,opt3);
	
				//If mouse enabled
				if mouse_enabled {
					if !instance_exists(option_object3) {
						instance_create_layer(option_x,oy,"hud",option_object3);
					}
				}
			}

		#endregion


		#region Enable action (changing option)

			//If up
			if keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) {
				//If 2 options
				if option_count == 2 {
					switch(selected) {

						case "option1":
						selected = "option2";
						break;

						case "option2":
						selected = "option1";
						break;
					}
				}
				//If 3 options
				if option_count == 3 {
					switch(selected) {

						case "option1":
						selected = "option3";
						break;

						case "option2":
						selected = "option1";
						break;

						case "option3":
						selected = "option2";
						break;
					}
				}
			}

			//If down
			if keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) {
				//If 2 options
				if option_count == 2 {
					switch(selected) {

							case "option1":
							selected = "option2";
							break;

							case "option2":
							selected = "option1";
							break;
							}
						}
				//If 3 options
				if option_count == 3 {
					switch(selected) {

						case "option1":
						selected = "option2";
						break;

						case "option2":
						selected = "option3";
						break;

						case "option3":
						selected = "option1";
						break;
					}
				}
			}

		#endregion

	}

	//This might not be necessary
	draw_set_halign(fa_left);

}
