///@function value_within_range(value 1, value 2, range)

//Checks if two values are within a given range of each other. Returns true or false.

/// @param value_1    The first value
/// @param value_2    The second value
/// @param range      The range to check

// Example: 'if value_within_range(5, 2, 3)' will return true because '5' and '2' and within 3 numbers from each other.

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------
function value_within_range(value_1, value_2, range)
{
	range = abs(range);
	if (value_1 + range < value_2) or (value_1 - range > value_2) return false;
	else return true;
}