///@description Draw instructions for the example
draw_set_halign(fa_left);
draw_set_font(instructions_font);
draw_set_colour(c_white);
//draw_text(camera_get_view_x(view_camera[view_current])+10,camera_get_view_y(view_camera[view_current])+10,
//"Move with arrows. \nPress space to speak.");


/*if textbox_exists() {
	draw_text(camera_get_view_x(view_camera[view_current])+10,camera_get_view_y(view_camera[view_current])+10,
	"\n\n"+string(textbox.message_length)+"\n"+string(textbox.characters)+"\n"+string(textbox.show_options_when));
}