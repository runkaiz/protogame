///@function value_closest(number, value_1, value_2, etc...)

// Returns the value that is closest to the chosen number, from a list of values.

/// @peram number		The number being compared to the list of values
/// @peram value_1		The first value to check
/// @peram value_2		The second value to check
/// @peram etc...		Any additional values to check

// Example: 'my_number = value_closest(10, 1, 5, 3);' will mean 'my_number' will equal 5, because that is the closest number to 10 in the list.

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------------------
function value_closest(number, value_1, value_2)
{
	if (argument_count < 3) return 0;
	
	var position = 0;
	var distance = 9999999;
	for (var i = 1; i < argument_count; i ++;)
	{
		if (abs(number - argument[i]) < distance) 
		{
			distance = abs(number - argument[i]);
			position = i;
		}
	}
	return argument[position];
}