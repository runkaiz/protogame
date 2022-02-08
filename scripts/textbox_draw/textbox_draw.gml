///@description textbox_draw
///@arg Text
///@arg CharacterName
///@arg Colour
///@arg TextColour
///@arg OutlineColour
///@arg Alpha
///@arg Font
///@arg Sprite
///@arg SelectedTextColour
///@arg Option1
///@arg Option2
///@arg Option3
///Draw a box with text - Supports different camera and view sizes
function textbox_draw() {

	/*/If there is a sprite, scale things to fit it
	if argument[7] != noone {
		var sprite_w = sprite_get_width(argument[7]);
	}else{
		var sprite_w = 0;
	}*/

	var smaller = 100; //This can be used to quickly change the size of everything
	
	//Check if views are being used and if position is set and then set position variables
	if view_enabled = true && position_set = false {
	
		var main_rect_x1 = camera_get_view_x(view_camera[view_current])+10;
		var main_rect_y1 = camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-187+smaller;
		var main_rect_x2 = camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-10;
		var main_rect_y2 = camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-10;
		var text_x = camera_get_view_x(view_camera[view_current])+20/*+sprite_w*/;
		var text_y = camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-177+smaller;
		var text_w = camera_get_view_width(view_camera[view_current])-(40/*+sprite_w*/);
		var name_rect_x1 = camera_get_view_x(view_camera[view_current])+10;
		var name_rect_y1 = camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-257+smaller*1.3;
		var name_rect_x2 = camera_get_view_x(view_camera[view_current])+290;
		var name_rect_y2 = (camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-180+smaller)-10;
		var name_x = camera_get_view_x(view_camera[view_current])+150;
		var name_y = camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-240+smaller*1.2;
	}else if position_set = false {
	
		var main_rect_x1 = 10;
		var main_rect_y1 = room_height-187+smaller;
		var main_rect_x2 = room_width-10;
		var main_rect_y2 = room_height-10;
		var text_x = 20/*+sprite_w*/;
		var text_y = room_height-177+smaller;
		var text_w = room_width-(40/*+sprite_w*/);
		var name_rect_x1 = 10;
		var name_rect_y1 = room_height-257+smaller*1.3;
		var name_rect_x2 = 300;
		var name_rect_y2 = (room_height-180+smaller)-10;
		var name_x = 160;
		var name_y = room_height-240+smaller*1.2;
	}else{
		var main_rect_x1 = x1;
		var main_rect_y1 = y1;
		var main_rect_x2 = x2;
		var main_rect_y2 = y2;
		var name_rect_x1 = namex1;
		var name_rect_y1 = namey1;
		var name_rect_x2 = namex2;
		var name_rect_y2 = namey2;
		if text_position_set = false {
			var text_x = x1+10/*+sprite_w*/;
			var text_y = y1+10;
		}else{
			var text_x = textx;
			var text_y = texty;
		}
		var text_w = x2-x1-(40/*+sprite_w*/);
		if name_text_position_set = false {
			var name_x = namex1+(namex2-namex1)/2;
			var name_y = namey1+(namey2-namey1)/2-15;
		}else{
			var name_x = nametextx;
			var name_y = nametexty;
		}
	}
	//More variables
	var main_rect_height = main_rect_y2-main_rect_y1;
	//var main_rect_width = main_rect_x2-main_rect_x1;
	
	//If there is a sprite, scale things to fit it
	if argument[7] != noone {
		var sprite_w = sprite_get_width(argument[7]);
		if sprite_w > main_rect_height {
			var spr_newsize = 1-(sprite_w-main_rect_height)/sprite_w;
		}else{
			var spr_newsize = main_rect_height/sprite_w;
		}
		var sprite_new_w = sprite_w*spr_newsize;
	}else{
		var sprite_new_w = 0;
	}
	text_x = text_x+sprite_new_w;
	text_w = text_w-sprite_new_w;
	

	if textbox_sprite_set = false {
	
		//MAIN RECTANGLE
		draw_set_colour(argument[2]);
		draw_set_alpha(argument[5]);
		draw_rectangle(main_rect_x1,main_rect_y1,main_rect_x2,main_rect_y2,false);

		//OUTLINE
		if argument[4] != noone {
			draw_set_colour(argument[4]);
			draw_rectangle(main_rect_x1,main_rect_y1,main_rect_x2,main_rect_y2,true);
		}

		//SPRITE
		if argument[7] != noone {
			
			var sprite_h = sprite_get_height(argument[7]);
			if sprite_h > main_rect_height {
				var spr_newsize = 1-(sprite_h-main_rect_height)/sprite_h;
			}else{
				var spr_newsize = main_rect_height/sprite_h;
			}
			
			if position_set = false {
				draw_sprite_ext(argument[7],-1,main_rect_x1,main_rect_y1,spr_newsize,spr_newsize,0,c_white,1);
			}else{
				draw_sprite_ext(argument[7],-1,spritex,spritey,spr_newsize,spr_newsize,0,c_white,1);
			}
		}

		//TEXT
		draw_set_colour(argument[3]);
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_font(argument[6]);
		draw_text_ext(text_x,text_y,argument[0],35,text_w);

		//NAME RECTANGLE
		if argument[1] != noone {
			draw_set_colour(argument[2]);
			draw_set_alpha(argument[5]);
			draw_rectangle(name_rect_x1,name_rect_y1,name_rect_x2,name_rect_y2,false);
		}

		//NAME RECTANGLE OUTLINE
		if argument[1] != noone {
			if argument[4] != noone {
				draw_set_colour(argument[4]);
				draw_rectangle(name_rect_x1,name_rect_y1,name_rect_x2,name_rect_y2,true);
			}
		}

		//NAME
		if argument[1] != noone {
			draw_set_colour(argument[3]);
			draw_set_alpha(1);
			draw_set_halign(fa_center);
			draw_text(name_x,name_y,argument[1]);
		}

	}else{
		//Draw the things with nine slice
		var slice_width = sprite_get_width(textbox_sprite)/3;
		var slice_height = sprite_get_height(textbox_sprite)/3;

		//MAIN RECTANGLE
		var width = abs(main_rect_x2-main_rect_x1);
		var height = abs(main_rect_y2-main_rect_y1);

		// Top
		draw_sprite_part_ext(textbox_sprite,0,0,0,slice_width, slice_height,main_rect_x1,main_rect_y1,1,1,c_white, 1); // Left
		draw_sprite_part_ext(textbox_sprite,0,slice_width,0,slice_width, slice_height,main_rect_x1+slice_width,main_rect_y1,(width-slice_width*2)/slice_width,1,c_white,1); // Middle
		draw_sprite_part_ext(textbox_sprite,0,slice_width*2,0,slice_width,slice_height,main_rect_x2-slice_width,main_rect_y1,1,1,c_white,1); // Right

		// Middle
		draw_sprite_part_ext(textbox_sprite,0,0,slice_height,slice_width,slice_height,main_rect_x1,main_rect_y1+slice_height,1,(height-slice_height*2)/slice_height,c_white,1); // Left
		draw_sprite_part_ext(textbox_sprite,0,slice_width,slice_height,slice_width,slice_height,main_rect_x1+slice_width,main_rect_y1+slice_height,(width-slice_width*2)/slice_width,(height-slice_height*2)/slice_height,c_white,1); // Middle
		draw_sprite_part_ext(textbox_sprite,0,slice_width*2,slice_height,slice_width,slice_height,main_rect_x2-slice_width,main_rect_y1+slice_height,1,(height-slice_height*2)/slice_height,c_white,1); // Right

		// Bottom
		draw_sprite_part_ext(textbox_sprite,0,0,slice_height*2,slice_width,slice_height*2,main_rect_x1,main_rect_y2-slice_height,1,1,c_white,1); // Left
		draw_sprite_part_ext(textbox_sprite,0,slice_width,slice_height*2,slice_width,slice_height,main_rect_x1+slice_width,main_rect_y2-slice_height,(width-slice_width*2)/slice_width,1,c_white,1); // Middle
		draw_sprite_part_ext(textbox_sprite,0,slice_width*2,slice_height*2,slice_width,slice_height,main_rect_x2-slice_width,main_rect_y2-slice_height,1,1,c_white,1); // Right
	
		//NAME RECTANGLE
		if argument[1] != noone {
			var slice_width = sprite_get_width(textbox_sprite2)/3;
			var slice_height = sprite_get_height(textbox_sprite2)/3;
		
			var width = abs(name_rect_x2-name_rect_x1);
			var height = abs(name_rect_y2-name_rect_y1);

			// Top
			draw_sprite_part_ext(textbox_sprite2,0,0,0,slice_width, slice_height,name_rect_x1,name_rect_y1,1,1,c_white, 1); // Left
			draw_sprite_part_ext(textbox_sprite2,0,slice_width,0,slice_width, slice_height,name_rect_x1+slice_width,name_rect_y1,(width-slice_width*2)/slice_width,1,c_white,1); // Middle
			draw_sprite_part_ext(textbox_sprite2,0,slice_width*2,0,slice_width,slice_height,name_rect_x2-slice_width,name_rect_y1,1,1,c_white,1); // Right

			// Middle
			draw_sprite_part_ext(textbox_sprite2,0,0,slice_height,slice_width,slice_height,name_rect_x1,name_rect_y1+slice_height,1,(height-slice_height*2)/slice_height,c_white,1); // Left
			draw_sprite_part_ext(textbox_sprite2,0,slice_width,slice_height,slice_width,slice_height,name_rect_x1+slice_width,name_rect_y1+slice_height,(width-slice_width*2)/slice_width,(height-slice_height*2)/slice_height,c_white,1); // Middle
			draw_sprite_part_ext(textbox_sprite2,0,slice_width*2,slice_height,slice_width,slice_height,name_rect_x2-slice_width,name_rect_y1+slice_height,1,(height-slice_height*2)/slice_height,c_white,1); // Right

			// Bottom
			draw_sprite_part_ext(textbox_sprite2,0,0,slice_height*2,slice_width,slice_height*2,name_rect_x1,name_rect_y2-slice_height,1,1,c_white,1); // Left
			draw_sprite_part_ext(textbox_sprite2,0,slice_width,slice_height*2,slice_width,slice_height,name_rect_x1+slice_width,name_rect_y2-slice_height,(width-slice_width*2)/slice_width,1,c_white,1); // Middle
			draw_sprite_part_ext(textbox_sprite2,0,slice_width*2,slice_height*2,slice_width,slice_height,name_rect_x2-slice_width,name_rect_y2-slice_height,1,1,c_white,1); // Right
		
			//NAME
			draw_set_colour(argument[3]);
			draw_set_alpha(1);
			draw_set_halign(fa_center);
			draw_text(name_x,name_y,argument[1]);
		}
		
		//SPRITE
		if argument[7] != noone {
			
			var sprite_h = sprite_get_height(argument[7]);
			if sprite_h > main_rect_height {
				var spr_newsize = 1-(sprite_h-main_rect_height)/sprite_h;
			}else{
				var spr_newsize = main_rect_height/sprite_h;
			}
			
			if sprite_position_set = false {
				draw_sprite_ext(argument[7],-1,main_rect_x1,main_rect_y1,spr_newsize,spr_newsize,0,c_white,1);
			}else{
				draw_sprite_ext(argument[7],-1,spritex,spritey,1,1,0,c_white,1);
			}
		}

		//TEXT
		draw_set_colour(argument[3]);
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_font(argument[6]);
		draw_text_ext(text_x,text_y,argument[0],35,text_w);
	}

	
	if characters >= message_length {
		
		//Draw "continue in dialogue" sign
		if continue_icon != noone && delay == false {
			draw_set_alpha(1);
			image_speed = 0.2;
			draw_sprite(continue_icon,-1,main_rect_x2-10,main_rect_y2-10);
		}
		
		//Show options
		if options_show = true {
			if argument_count >= 12 {
				options_draw(argument[3],argument[8],argument[6],argument[9],argument[10],argument[11]);
			}else
			if argument_count >= 11 {
				options_draw(argument[3],argument[8],argument[6],argument[9],argument[10]);
			}else
			if argument_count >= 10 {
				options_draw(argument[3],argument[8],argument[6],argument[9]);
			}
		}
	}



	draw_set_halign(fa_left);


}
