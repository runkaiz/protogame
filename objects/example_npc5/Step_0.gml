/// @description Example speech bubble with options
if keyboard_check_pressed(vk_space) {
	if place_meeting(x,y,example_player) {
		
		//Make a speech bubble
		if !textbox_exists() {
			textbox_create("There are options in speech bubbles!","I'm sooooooooo happy!","YAY!");
			textbox_set_bubble("James",c_black,c_white,1,example_font,25,300,example_npc5,true);
			textbox_add_options(c_black,1,"Yay!","AAFKfAF!!!!");
			textbox_change_message_according_option(2,"YAY!","???????????");
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