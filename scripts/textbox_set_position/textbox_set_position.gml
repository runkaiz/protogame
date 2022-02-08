///@description textbox_set_position
///@arg x1
///@arg y1
///@arg x2
///@arg y2
///@arg [namex1
///@arg namey1
///@arg namex2
///@arg namey2
///@arg spriteX
///@arg spriteY
///@arg textX
///@arg textY
///@arg NameTextX
///@arg NameTextY]
function textbox_set_position() {
	//Changes the position of the textbox, name box and character sprite (and additionally, the text)

	//NOTE: About the arguments textX, textY, NameTextX and NameTextY:
	//They will automatically go to the right places,
	//but if you don't like how they go then you can use these arguments.

	with(textbox) {
		position_set = true;
		x1 = argument[0];
		y1 = argument[1];
		x2 = argument[2];
		y2 = argument[3];
		if argument_count >= 5 {
			namex1 = argument[4];
			namey1 = argument[5];
			namex2 = argument[6];
			namey2 = argument[7];
		}
		if argument_count >= 9 {
			sprite_position_set = true;
			spritex = argument[8];
			spritey = argument[9];
		}
		if argument_count >= 11 {
			text_position_set = true;
			textx = argument[10];
			texty = argument[11];
		}
		if argument_count >= 13 {
			name_text_position_set = true;
			nametextx = argument[12];
			nametexty = argument[13];
		}
	}

	/*Example:
	textbox_set_position(100,room_height-200,room_width-100,room_height-10);

	This sets the textbox to a position in the room, using only the necessary arguments.*/
}
