///@function show_debug_message_ds_list(list, "list", cooldown, pos_1 [optional], pos_2 [optional])

// Creates a debug message containing a ds list and it's values.

/// @peram list		  The ds list.
/// @peram "list"	  The name of the ds list (as a string).

/// @peram cooldown	  How long to wait (in seconds, whole numbers only) in between sending debug messages. 

/// @peram pos_1	  The first position in the ds list that should be included in the debug message.
/// @peram pos_2	  The second position in the ds list that should be included in the debug message.

// ^ The last two arguments are optional; leave them BOTH blank to include all positions in the ds list in the debug message.

// Example: show_debug_message_ds_list(my_list, "my_list", 2);

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------------
function show_debug_message_ds_list(list, list_name, cooldown)
{
	var first_message = true;
	if (cooldown > 0)
	{
		var my_position = -1;
		if !(variable_instance_exists(id, "debug_message_list_array")) 
		{
			debug_message_list_array[0][0] = list_name;
			debug_message_list_array[0][1] = date_current_datetime();
			my_position = 0;
		}
		else
		{
			var array_size = array_length(debug_message_list_array);
			for (var i = 0; i < array_size; i ++;)
			{
				var value = debug_message_list_array[i][0];
				if (value = list_name)
				{
					my_position = i; 
					first_message = false;
					break;
				}
			}
			if (my_position = -1)
			{
				debug_message_list_array[array_size][0] = list_name;
				debug_message_list_array[array_size][1] = date_current_datetime();
				my_position = array_size;
			}
		}
		var cooldown_second = debug_message_list_array[my_position][1];
		var cooldown_over = date_second_span(cooldown_second, date_current_datetime()) >= cooldown
	}
	
	
	if (cooldown <= 0) or (cooldown > 0 and cooldown_over) or (first_message)
	{
		var list_size = ds_list_size(list) - 1;
		var pos_1 = 0;
		var pos_2 = list_size;
		if (argument_count >= 4)
		{
			pos_1 = argument[3];
			pos_2 = argument[4];
		}
		
		var Message = "";
		for (var i = pos_1; i <= pos_2; i ++;)
		{
			var value = ds_list_find_value(list, i);
			var text = list_name + "(" + string(i) + "): " + string(value);
			if !(i = pos_2) text += "\n"; 
			Message += text;
		}
		show_debug_message(Message);	
		
		if (cooldown > 0) and (cooldown_over)
		{
			debug_message_list_array[my_position][1] = date_current_datetime();
		}
	}
}

