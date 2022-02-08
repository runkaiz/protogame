///@description textbox_change_var_at_end
///@arg objectID
///@arg variable
///@arg value
function textbox_change_var_at_end() {
	//Changes a variable when the dialogue ends. The variable needs to be between "".

	with(textbox) {
		var_object = argument[0];
		var_to_change = argument[1];
		var_value = argument[2];
	}


	/*Example:
	textbox_change_var_at_end(player.id,"hp",10);
	This sets a variable called hp to 10 at the end of the dialogue.*/
}
