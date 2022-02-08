/// @description Example speech bubble
if keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) {
	if place_meeting(x,y,example_player) {
		
		//Make a speech bubble
		if !textbox_exists() {
			textbox_create("Hello, I'm a speaking plant and this is a speech bubble.","The size and colour can be changed.","And I think it also follows me...","Maybe I'm just becoming crazy.","...");
			textbox_set_bubble(noone,c_white,c_black,1,example_font,25,350,example_npc4,true,example_continue2);
			textbox_set_key(ord("Z"),ord("X"));
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