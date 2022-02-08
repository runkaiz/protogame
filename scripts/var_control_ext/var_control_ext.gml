///@function var_control_ext("variable", id, key_next, key_previous, value_1, etc...)

// Lets you set a variable's current value to be another value, from a list of values of your choice,
// using keys of your choice to cycle through the values in that list of values.
// Intended purpose is for debugging.

/// @peram "variable"		The name of the variable (as a string) whose current value will be able to be set to another value, from a list of values
/// @peram id				The instance id of the instance that owns the variable. 
/// @peram key_next			The key that will make the variable's current value be set to the next value in the list of values.
/// @peram key_decrement    The key that will make the variable's current value be set to the previous value in the list of values. 
/// @peram value_1			The first value in the list of values. Can be one individual value, a 1d array, or a ds list.
/// @peram etc...			Any additional values to include. Can be one individual value, a 1d array, or a ds list.

// Example 1: var_control_ext("x", id, vk_right, vk_left, 0, 23, 100, 283, 342);
// Example 2: var_control_ext("x", id, vk_right, vk_left, array_coordinates);

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function var_control_ext(variable, ID, key_next, key_previous, value_1)
{
	if !(variable_instance_exists(id, "var_control_ext_array"))
	{
		var_control_ext_array[0][0] = variable;
		var_control_ext_array[0][1] = 0;
	}
	else
	{
		var my_variable_pos = -1;
		var len = array_length(var_control_ext_array);
		for (var i = 0; i < len; i ++;)
		{
			var this = var_control_ext_array[i][0];
			if (variable = this) 
			{
				my_variable_pos = i;
				break;
			}
		}
		if (my_variable_pos = -1)
		{
			my_variable_pos = len;
			var_control_ext_array[len][0] = variable;
			var_control_ext_array[len][1] = 0;
		}
	}
	
	var values_array = -1;
	var h = 0;
	for (var i = 4; i < argument_count; i ++;)
	{
		var value = argument[i];
		if (is_array(value))
		{
			var array = value;
			var len  = array_length(array)
			for (var j = 0; j < len; j ++;)
			{
				value = array[j];
				values_array[h] = value;
				h ++;
			}
		}
		else if ds_exists(value, ds_type_list)
		{
			var list = value;
			var size  = ds_list_size(list)
			for (var j = 0; j < size; j ++;)
			{
				value = ds_list_find_value(list, j);
				values_array[h] = value;
				h ++;
			}
		}
		else 
		{
			values_array[h] = value;
			h ++;
		}
	}
	
	key_next     = keyboard_check_pressed(key_next);
	key_previous = keyboard_check_pressed(key_previous);
	var crement  = key_next - key_previous;
	
	if !(crement = 0)
	{
		var_control_ext_array[my_variable_pos][1] += crement;
		if (var_control_ext_array[my_variable_pos][1] >= array_length(values_array)) var_control_ext_array[my_variable_pos][1] = 0;
		if (var_control_ext_array[my_variable_pos][1] < 0)							 var_control_ext_array[my_variable_pos][1] = array_length(values_array) - 1;
		var pos = var_control_ext_array[my_variable_pos][1];
		var value = values_array[pos];
		variable_instance_set(ID, variable, value);
	}
}