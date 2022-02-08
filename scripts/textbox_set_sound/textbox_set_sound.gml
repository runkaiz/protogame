///@description textbox_set_sound
///@arg sound
///@arg [volume
///@arg interval] - In steps
function textbox_set_sound() {
	//Set the sound of the textbox
	with(textbox) {
		
		textsound = argument[0];
		text_sound = true;
		
		if argument_count >= 2 {
			text_sound_volume = argument[1];
		}
		if argument_count >= 3 {
			text_sound_interval = argument[2];
		}
	}

	//Example:
	//textbox_set_sound(sound_typewriter,global.volume,10);
	//This sets the text sound to a sound called sound_typewriter, volume to global.volume variable and interval to 10 steps.

}