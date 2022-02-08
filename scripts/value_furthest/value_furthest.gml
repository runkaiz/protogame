///@function value_furthest(number, value 1, value 2, etc...)

// Returns the value that is the furthest from a number, from a list of values.
// If there are multiple values are the furthest away from the number being checked, which ever value appears
// earliest in the list of arguments will be returned.

/// @peram number		The number that is being compared to the list of values.
/// @peram value 1		The first value to check.
/// @peram value 2		The second value to check.
/// @peram etc...		Any additional values to check.

// Example: var furthest_from_10 = value_furthest(10, 0, 20);

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------------
function value_furthest(number)
{
	var pos, dist;
	for (var i = 1; i < argument_count; i ++;)
	{
		var value = argument[i]
		if (i = 1) or (abs(number - value) > dist)
		{
			dist = abs(number - value);
			pos = i;
		}
	}
	return argument[pos];
}