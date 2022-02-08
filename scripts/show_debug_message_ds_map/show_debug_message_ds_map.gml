///@function show_debug_message_ds_map(map, "map", cooldown [optional])

/// @peram map			  The ds map.
/// @peram "map"		  The name of the ds map (as a string).

/// @peram cooldown		  How long to wait (in seconds) in between sending debug messages.
///						  This is optional; leave this argument blank and it will default to 1.

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------
function show_debug_message_ds_map(map, map_name)
{
	var first_message = true;
	
	var cooldown = 1;
	if (argument_count > 2) cooldown = argument[2];
	
	if (cooldown > 0)
	{
		var my_position = -1;
		if !(variable_instance_exists(id, "debug_message_map_array")) 
		{
			debug_message_map_array[0][0] = map_name;
			debug_message_map_array[0][1] = date_current_datetime();
			my_position = 0;
		}
		else
		{
			var length = array_length(debug_message_map_array);
			for (var i = 0; i < length; i ++;)
			{
				var value = debug_message_map_array[i][0];
				if (value = map_name)
				{
					my_position = i; 
					first_message = false;
					break;
				}
			}
			if (my_position = -1)
			{
				debug_message_map_array[length][0] = map_name;
				debug_message_map_array[length][1] = date_current_datetime();
				my_position = length;
			}
		}
		var cooldown_second = debug_message_map_array[my_position][1];
		var cooldown_over = date_second_span(cooldown_second, date_current_datetime()) >= cooldown
	}
	
	if (cooldown <= 0) or (cooldown > 0 and cooldown_over) or (first_message)
	{
		var map_size = ds_map_size(map) - 1;
	
		var Message = "";
		var first_key = ds_map_find_first(map);
		var current_key = first_key;
		var current_value = ds_map_find_value(map, current_key);
		for (var i = 0 ; i <= map_size; i ++;)
		{
			var text = map_name + "[\"" + string(current_key) + "\"][" + string(current_value) + "]";
			if !(i = map_size) text += "\n"; 
			Message += text;
		
			current_key = ds_map_find_next(map, current_key);
			current_value = string(ds_map_find_value(map, current_key));
		}
		show_debug_message(Message);	
		
		if (cooldown > 0) and (cooldown_over)
		{
			debug_message_map_array[my_position][1] = date_current_datetime();
		}
	}
}