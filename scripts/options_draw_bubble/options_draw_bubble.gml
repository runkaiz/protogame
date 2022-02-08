///@description options_draw_bubble
///@arg TextColour
///@arg SelectedTextColour
///@arg Font
///@arg x
///@arg y
///@arg option1
///@arg option2
///@arg option3
///Draws the options
function options_draw_bubble() {

	//If there are options
	if argument_count >= 6 {

		#region Check how many options there are

			//Count options
			if argument_count == 8 {
				option_count = 3;
				var opt1 = argument[5];
				var opt2 = argument[6];
				var opt3 = argument[7];
				var opt1_w = string_width(opt1);
				var opt2_w = string_width(opt2);
				var opt3_w = string_width(opt3);
				var opt_w = max(opt1_w,opt2_w,opt3_w);
			}else
			if argument_count == 7 {
				var option_count = 2;
				var opt1 = argument[5];
				var opt2 = argument[6];
				var opt1_w = string_width(opt1);
				var opt2_w = string_width(opt2);
				var opt_w = max(opt1_w,opt2_w);
			}else
			if argument_count == 6 {
				var option_count = 1;
				var opt1 = argument[5];
				var opt_w = string_width(opt1);
			}else{
				var option_count = 0;
			}

		#endregion

		#region Variables

			var textcolor = argument[0];
			var selectedcolor = argument[1];
			var fontt = argument[2];
			var xx = argument[3];
			var yy = argument[4];

		#endregion

		#region Draw the options - THERE ARE PROBLEMS SOMETHIMES IN DIFFERENT VIEW SIZES
			
			//Set things
			//Font
			draw_set_font(fontt);
			//Halign
			draw_set_halign(fa_center);
			//Text height
			var opt_h = string_height(opt1);

			//Draw option 1
			
			//Position
			if option_outside_view == false {
				if option_count == 3 {
					var oy = yy-opt_h*3;
				}else if option_count == 2 {
					var oy = yy-opt_h*2;
				}else if option_count == 1 {
					var oy = yy-opt_h;
				}
			}else{
				var oy = yy+opt_h;
			}
			
			//Colour & rectangle when selected
			if selected == "option1" {
				//Rectangle
				draw_set_colour(textcolor);
				draw_roundrect(xx-opt_w/2,oy,xx+opt_w/2,oy+opt_h,false);
				//Colour
				draw_set_colour(selectedcolor);
			}else{
				draw_set_colour(textcolor);
			}
		
			//Text
			draw_text(xx,oy,opt1);

			//If mouse enabled
			if mouse_enabled {
				if !instance_exists(option_object1) {
					instance_create_layer(xx,oy,"hud",option_object1);
				}
			}


			//Draw option 2
			if option_count >= 2 {
				
				//Position
				if option_outside_view == false {
					if option_count == 3 {
						oy = yy-opt_h*2;
					}else if option_count == 2 {
						oy = yy-opt_h;
					}
				}else{
					oy = yy+opt_h*2;
				}
				
				//Colour & rectangle when selected
				if selected == "option2" {
					//Rectangle
					draw_set_colour(textcolor);
					draw_roundrect(xx-opt_w/2,oy,xx+opt_w/2,oy+opt_h,false);
					//Colour
					draw_set_colour(selectedcolor);
				}else{
					draw_set_colour(textcolor);
				}
				
				//Text
				draw_text(xx,oy,opt2);
				
				//If mouse enabled
				if mouse_enabled {
					if !instance_exists(option_object2) {
						instance_create_layer(xx,oy,"hud",option_object2);
					}
				}
			}


			//Draw option 3
			if option_count >= 3 {
			
				//Position
				if option_outside_view == false {
					oy = yy-opt_h;
				}else{
					oy = yy+opt_h*3;
				}
				
				//Colour & rectangle when selected
				if selected == "option3" {
					//Rectangle
					draw_set_colour(textcolor);
					draw_roundrect(xx-opt_w/2,oy,xx+opt_w/2,oy+opt_h,false);
					//Colour
					draw_set_colour(selectedcolor);
				}else{
					draw_set_colour(textcolor);
				}
				
				//Text
				if option_count == 3 {
					draw_text(xx,oy,opt3);
				}
				
				//If mouse enabled
				if mouse_enabled {
					if !instance_exists(option_object3) {
						instance_create_layer(xx,oy,"hud",option_object3);
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

	draw_set_halign(fa_left);

}
