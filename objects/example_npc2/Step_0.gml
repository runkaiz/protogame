///@description Example simple textbox
//This is just another example of this. The more detailed example is in the object example_npc.
if keyboard_check_pressed(vk_space) {
	if place_meeting(x,y,example_player) {
		if !textbox_exists() {
			textbox_create("Hi. It's me. You remember me, right?","No...?","I'm you.","You don't get it? I knew this is something too deep to be just an example dialogue.");
			textbox_set("You",c_blue,c_white,c_white,0.7,example_font,noone,true);
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