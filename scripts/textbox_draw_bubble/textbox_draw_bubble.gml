///@description textbox_draw_bubble
///@arg Text
///@arg CharacterName
///@arg Colour
///@arg TextColour
///@arg Alpha
///@arg Font
///@arg separation
///@arg bubblewidth
///@arg ObjectTalking
///@arg [SelectedTextColour
///@arg Option1
///@arg Option2
///@arg Option3]
//Draw a bubble with text
function textbox_draw_bubble() {

	#region VARIABLES

		var vtext = argument[0];
		var vcharactername = argument[1];
		var vcolour = argument[2];
		var vtextcolour = argument[3];
		//var voutlinecolour = argument[4]; COMING SOON MAYBE
		var valpha = argument[4];
		var vfont = argument[5];
		var vseparation = argument[6];
		var vbubblewidth = argument[7];
		var vobject = argument[8];
		if argument_count >= 10 {
			var vselectedtextcolour = argument[9]; 
		}
		if argument_count >= 11 {
			var voption1 = argument[10];
		}
		if argument_count >= 12 {
			var voption2 = argument[11];
		}
		if argument_count >= 13 {
			var voption3 = argument[12];
		}
	
		//Calculate text height (Set the font here to calculate things correctly)
		draw_set_font(vfont);
		var text_height = string_height_ext(vtext,vseparation,vbubblewidth-6);
		var nameheight = string_height(vcharactername);
		var DistFromObj = sprite_get_height(vobject.sprite_index);

		//Position of things
		var xx1 = vobject.x-vbubblewidth/2;
		if vcharactername != noone {
			var yy1 = vobject.y-DistFromObj-2-nameheight-text_height;
		}else{
			var yy1 = vobject.y-DistFromObj-2-text_height;
		}
		var xx2 = vobject.x+vbubblewidth/2;
		var yy2 = vobject.y-DistFromObj;
		var text_yy = vobject.y-DistFromObj-text_height;
		var show_pointer = true;
		
		//If outside view
		if view_enabled == false {
			if xx1<0 {
				xx2 = xx2-xx1;
				xx1 = 0;
			}
			if xx2>room_width {
				xx1 = room_width-(xx2-xx1);
				xx2 = room_width;
			}
			if yy1<=0 {
				yy2 = yy2-yy1+10;
				yy1 = 0;
				if vcharactername == noone {
					text_yy = yy1;
				}else{
					text_yy = nameheight;
				}
				show_pointer = false;
			}
		}else{
			if xx1<camera_get_view_x(view_camera[view_current]) {
				xx2 = xx2-xx1;
				xx1 = 0;
			}
			if xx2>camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]) {
				xx1 = camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-(xx2-xx1);
				xx2 = camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current]);
			}
			if yy1<=camera_get_view_y(view_camera[view_current]) {
				yy2 = yy2-yy1+10;
				yy1 = camera_get_view_y(view_camera[view_current]);
				if vcharactername == noone {
					text_yy = yy1;
				}else{
					text_yy = nameheight;
				}
				show_pointer = false;
			}
		}

	#endregion


	#region DRAW THINGS
		
		//Rectangle
		draw_set_colour(vcolour);
		draw_set_alpha(valpha);
		draw_roundrect(xx1,yy1,xx2,yy2,false);
		
		if show_pointer {
			//Pointer
			draw_triangle(vobject.x-8,yy2,vobject.x+8,yy2,vobject.x,vobject.y-DistFromObj/1.3,false);
		}
		
		//Text
		draw_set_colour(vtextcolour);
		draw_set_alpha(1);
		draw_set_halign(fa_center);
		var text_xx = xx2-(xx2-xx1)/2;
		draw_text_ext(text_xx,text_yy,vtext,vseparation,vbubblewidth-6);
		
		//Characters name
		if vcharactername != noone {
			draw_set_colour(vtextcolour);
			draw_set_alpha(0.7);
			draw_set_halign(fa_center);
			draw_text(text_xx,text_yy-vseparation,vcharactername);
		}

	#endregion

		if characters >= message_length {
		
			//Draw "continue in dialogue" sign
			if continue_icon != noone && delay == false {
				draw_set_alpha(1);
				image_speed = 0.2;
				draw_sprite(continue_icon,0,vobject.x+vbubblewidth/2,yy2);
			}

			#region OPTIONS
				
				//Options position
				var posx = text_xx;
				var posy = yy1;
				
				option_outside_view = false;
				if view_enabled == false {
					if yy1<=0 {
						var posy = yy2-vseparation+5;
						option_outside_view = true;
					}
				}else if yy1<=camera_get_view_y(view_camera[view_current]) {
					var posy = yy2-vseparation+5;
					option_outside_view = true;
				}


				if options_show == true {
					if argument_count >= 13 {
						options_draw_bubble(vtextcolour,vselectedtextcolour,vfont,posx,posy,voption1,voption2,voption3);
					}else
					if argument_count >= 12 {
						options_draw_bubble(vtextcolour,vselectedtextcolour,vfont,posx,posy,voption1,voption2);
					}else
					if argument_count >= 11 {
						options_draw_bubble(vtextcolour,vselectedtextcolour,vfont,posx,posy,voption1);
					}
				}

			#endregion
		}

	//Reset settings - This might not be necessary.
	draw_set_halign(fa_left);
	draw_set_alpha(1);

}