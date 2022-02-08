///@function value_round_odd(value, round up?)

// Rounds a real number number up or down to the nearest odd number and returns that odd number.
// (If you choose to round down, and the number being rounded is already an odd number, that number will return itself.)

/// @peram value			The number to round.
/// @peram round up?		Whether or not to round up to the nearest odd number (true) or down to the nearest odd number (false).

// Script by MaxLos :)
//--------------------------------------------------------------------------------------------------------------------------------------
function value_round_odd(value, round_up)
{
	if (value = 0) return 1;
	
	value = floor(value);
	var value_is_even = ( (value mod 2) = 0);
	
	if (value_is_even) 
	{
		if (round_up) return value + 1;
		else return value - 1;
	}
	else
	{
		if (round_up) return value + 2;
		else          return value;
	}
}