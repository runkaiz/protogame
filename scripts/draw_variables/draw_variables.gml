///@function draw_variables(x, y, y_space, object or instance id, "variable_1", "variable_2", etc...)

// Draws the name and values of variables of an instance. Should be used for debugging purposes only.
// The variables and their values will be drawn descending, like a list.
// If the variable doesn't exist for that instance, the drawn value will be "undefined".

/// @param  x              The x coordinate to draw the variables. 
/// @param  y              The starting y coordinate to draw the variables.
/// @param  y space		   The vertical spacing between each drawn variable and their value.
/// @param  instance       The id of the instance whose variables will be drawn. 
/// @param  "variable_1"   The first variable to draw. 
/// @param  etc...   	   Any additional variables to draw.

// Example: draw_variable_list(0, 0, -1, id, "hsp", "vsp", "grv");

// Script by MaxLos :)
//-----------------------------------------------------------------------------------------------------------------------------
function draw_variables(xx, yy, y_space, instance) 
{
	var actual_y_space = y_space;
	for (var i = 0; i < argument_count - 4; i++;)
	{
		var text = argument[4 + i] + " = " +  string(variable_instance_get(instance, argument[4 + i]))
		if (i > 0) and (y_space = -1)
		{
			var last_text = argument[4 + i - 1] + " = " +  string(variable_instance_get(instance, argument[4 + i - 1]))
			actual_y_space = string_height(last_text);
		}
	    draw_text(xx, yy + (actual_y_space * i), text);
	}
}


