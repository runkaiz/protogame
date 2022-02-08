///@description textbox_set_sprite
///@arg MainRectangleSprite
///@arg NameRectangleSprite
function textbox_set_sprite() {
	//Sets a sprite to the textbox, instead of only colored rectangles - The sprite size needs to be a multiple of 3

	with(textbox) {
		textbox_sprite = argument[0];
		textbox_sprite_set = true;
		if argument_count = 2 {
			textbox_sprite2 = argument[1];
		}else{
			textbox_sprite2 = argument[0];
		}
	}

	///Example:
	//textbox_set_sprite(sprite_textbox);

}
