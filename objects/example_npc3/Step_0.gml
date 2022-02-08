/// @description Example changing variable
if keyboard_check_pressed(vk_space) {
	if place_meeting(x,y,example_player) {
		
		//Create textbox & set things, add options
		if !textbox_exists() {
			textbox_create("Hey, you look tired.","Need more hp?","There you go!","Remember to get some rest.");
			textbox_set(noone,c_dkgray,c_yellow,c_yellow,1,example_font,noone,true);
			textbox_add_options(c_blue,1,"Yes please!","Only a little bit.");
		}
	}
}

//Change a variable depending on the option the player chooses
//We check the collision only to know if the player is speaking with this npc. This way the variable won't change when talking to others.
if place_meeting(x,y,example_player) {
	if chooses_option() = 1 {
		with(example_player) {
			hp += 90;
		}
	}else if chooses_option() = 2 {
		with(example_player) {
			hp += 20;
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