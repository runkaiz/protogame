///@description textbox_set_bubble
///@arg CharacterName
///@arg Colour
///@arg TextColour
///@arg Alpha
///@arg Font
///@arg separation
///@arg BubbleWidth
///@arg ObjectTalking
///@arg [EnableMouse
///@arg ContinueIcon]
///Set the stlye of speech bubble - This is needed to use it.
function textbox_set_bubble() {

	with(textbox) {
		name = argument[0];
		general_colour = argument[1];
		text_colour = argument[2];
		alpha = argument[3];
		font = argument[4];
		separation = argument[5];
		bubble_width = argument[6];
		object_talking = argument[7];
		if argument_count >= 9 {
			mouse_enabled = argument[8];
		}
		if argument_count >= 10 {
			continue_icon = argument[9];
		}
	
		mode = "bubble";
	}


	//Example:
	//textbox_set_bubble("Bob",c_black,c_white,c_white,1,Bobs_favourite_font,25,300,obj_player);
	//Tip: To make it fit smaller view sizes, make the font smaller and also make the separation and BubbleWidth smaller.

}
