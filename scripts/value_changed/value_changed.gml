///@function value_changed("variable", id, update?)

// Returns whether or not a variable's value changed on the current game Step.

/// @peram "variable"	The name of the variable to check to see if it's value has changed.
/// @peram id			The instance id of the owner of the variable being checked.

/// @peram update?		Whether or not to update the status of the previous value of the checked variable during this script call.
///
///						Set this argument to 'false' if you are calling this script multiple times and checking for the same variable;
///						in those cases, the "latest" script call should be set to 'true'. Example: If you were to check to see if the variable "HP" has changed values
///						in both the 'Begin Step Event' and the 'End Step Event', this argument for the script call in the 'Begin Step Event'
///						should be set to 'false', while the script call in the 'End Step Event' should be set to true.
///
///						Otherwise, set to 'true'.

// To use this script properly, you must store the return value of this script in a variable, then check that variable itself.
// Do NOT check the script itself using conditional statements, or within nested conditonal statements, nor have the variable within
// any nested conditonal statments.

// Example: var sprite_changed = value_changed("sprite_index", id, true);
//			if (sprite_changed) { * do something * }

// Script by MaxLos :) 
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function value_changed(variable, ID, update)
{
	var pos = -1;
	var variable_value = variable_instance_get(ID, variable);
	if !(variable_instance_exists(id, "value_array"))
	{
		value_array[0][0] = variable;
		value_array[0][1] = variable_value;
		pos = 0;
	}
	else
	{
		var len = array_length(value_array);
		for (var i = 0; i < len; i ++;)
		{
			if (value_array[i][0] = variable) 
			{
				pos = i;
				break;
			}
		}
		if (pos = -1)
		{
			pos = len;
			value_array[len][0] = variable;
			value_array[len][1] = variable_value;
		}
		
	}
	if (value_array[pos][1] != variable_value) 
	{
		if (update) value_array[pos][1] = variable_value;
		return true;
	}
	if (update) value_array[pos][1] = variable_value;
	return false;
}
