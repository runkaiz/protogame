/// @description Example speech bubble on another object
if keyboard_check_pressed(vk_space) {
	if place_meeting(x,y,example_player) {
		
		//Make a speech bubble
		if !textbox_exists() {
			textbox_create("Stop speaking to him!","Speak to me!");
			//This time we put the speech bubble to the npc4 and not to this object...
			textbox_set_bubble(noone,c_white,c_black,1,example_font,25,250,example_npc4,true);
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