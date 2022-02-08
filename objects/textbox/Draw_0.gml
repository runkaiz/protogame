/// @description Draw textbox
if textbox_visible {
	if mode = "box" {
		if optioncount == 0 {
			textbox_draw(message_draw,name,general_colour,text_colour,outline_colour,alpha,font,sprite);
		}else if optioncount == 1 {
			textbox_draw(message_draw,name,general_colour,text_colour,outline_colour,alpha,font,sprite,s_text_colour,option1);
		}else if optioncount == 2 {
			textbox_draw(message_draw,name,general_colour,text_colour,outline_colour,alpha,font,sprite,s_text_colour,option1,option2);
		}else if optioncount == 3 {
			textbox_draw(message_draw,name,general_colour,text_colour,outline_colour,alpha,font,sprite,s_text_colour,option1,option2,option3);
		}
	}else{
		if optioncount == 0 {
			textbox_draw_bubble(message_draw,name,general_colour,text_colour,alpha,font,separation,bubble_width,object_talking);
		}else if optioncount == 1 {
			textbox_draw_bubble(message_draw,name,general_colour,text_colour,alpha,font,separation,bubble_width,object_talking,s_text_colour,option1);
		}else if optioncount == 2 {
			textbox_draw_bubble(message_draw,name,general_colour,text_colour,alpha,font,separation,bubble_width,object_talking,s_text_colour,option1,option2);
		}else if optioncount == 3 {
			textbox_draw_bubble(message_draw,name,general_colour,text_colour,alpha,font,separation,bubble_width,object_talking,s_text_colour,option1,option2,option3);
		}
	}
}
if backlog_visible {
	textbox_draw_backlog();
}