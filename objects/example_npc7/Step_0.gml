/// @description Example textbox sprite
if keyboard_check_pressed(vk_space) {
	if place_meeting(x,y,example_player) {	
		//Create textbox & set things
		if !textbox_exists() {
			textbox_create("You can now add your own GUI sprite to the textbox.","It's also possible to change the position of everything!","It's amazing! So many possibilities!");
			textbox_set("AwesomeGuy",c_black,c_green,noone,1,example_font,noone,true);
			//Add a sprite that replaces the color rectangles
			textbox_set_sprite(example_sprite_textbox,example_sprite_textbox3);
			//Change the position of the textbox and name box and text to make a cool layout
			textbox_set_position(camera_get_view_x(view_camera[view_current])+100,
			camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-150,
			camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])-100,
			camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-10,
			camera_get_view_x(view_camera[view_current])+110,
			camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-190,
			camera_get_view_x(view_camera[view_current])+300,
			camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-140,
			0,0,camera_get_view_x(view_camera[view_current])+110,
			camera_get_view_y(view_camera[view_current])+camera_get_view_height(view_camera[view_current])-135);
		}
	}
}



//This does that the object is under others if they are in front of it.
//But if there is a textbox the object would be in front of it, so we disable this when textbox exists.
if !instance_exists(textbox) {
	depth = -y;
}else{
	depth = 0;
}