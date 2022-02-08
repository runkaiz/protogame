///@description textbox_set_key
///@arg ForSpeak
///@arg [ForSkip]
///Change the keyboard key used to continue in dialogue and to skip dialogue
function textbox_set_key() {

	with(textbox) {
		speak_key = argument[0];
		if argument_count = 2 {
			skip_key = argument[1];
		}
	}


	//Example:
	//textbox_set_key(vk_space,ord("X"));
	//This sets the speak key to space and skip key to X.


}
