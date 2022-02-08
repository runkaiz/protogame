///@function show_debug_message_array_1d(array, "array", cooldown, pos_1 [optional], pos_2 [optional])

// Creates a debug message containing a 1d array and it's values.

/// @peram list		  The array.
/// @peram "list"	  The name of the array (as a string).

/// @peram cooldown	  How long to wait (in seconds) in between sending debug messages.
///					  (this is to prevent the output window from becoming flooded)

/// @peram pos_1	  The first position in the array that should be included in the debug message.
/// @peram pos_2	  The second position in the array that should be included in the debug message.

// ^ The last two arguments are optional; leave them BOTH blank to include all positions in the array in the debug message.

// Example: show_debug_message_array_1d(my_array, "my_array", 2);

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------------
function show_debug_message_array_1d(array, array_name, cooldown)
{
	var first_message = true;
	if (cooldown > 0)
	{
		var my_position = -1;
		if !(variable_instance_exists(id, "debug_message_array_array")) 
		{
			debug_message_array_array[0][0] = array_name;
			debug_message_array_array[0][1] = date_current_datetime();
			my_position = 0;
		}
		else
		{
			var length = array_length(debug_message_array_array);
			for (var i = 0; i < length; i ++;)
			{
				var value = debug_message_array_array[i][0];
				if (value = array_name)
				{
					my_position = i; 
					first_message = false;
					break;
				}
			}
			if (my_position = -1)
			{
				debug_message_array_array[length][0] = array_name;
				debug_message_array_array[length][1] = date_current_datetime();
				my_position = length;
			}
		}
		var cooldown_second = debug_message_array_array[my_position][1];
		var cooldown_over = date_second_span(cooldown_second, date_current_datetime()) >= cooldown
	}
	
	
	if (cooldown <= 0) or (cooldown > 0 and cooldown_over) or (first_message)
	{
		var length = array_length(array) - 1;
		var pos_1 = 0;
		var pos_2 = length;
		if (argument_count >= 4)
		{
			pos_1 = argument[3];
			pos_2 = argument[4];
		}
		
		var Message = "";
		for (var i = pos_1; i <= pos_2; i ++;)
		{
			var value = array[i];
			var text = array_name + "[" + string(i) + "]: " + string(value);
			if !(i = pos_2) text += "\n"; 
			Message += text;
		}
		show_debug_message(Message);	
		
		if (cooldown > 0) and (cooldown_over)
		{
			debug_message_array_array[my_position][1] = date_current_datetime();
		}
	}
}

