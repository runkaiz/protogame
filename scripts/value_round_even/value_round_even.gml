///@function value_round_even(value, round up?)

// Rounds a real number number up or down to the nearest even number and returns that even number.
// (If you choose to round down, and the number is already an even number, the number will return itself.)

/// @peram value			The number to round.
/// @peram round up?		Whether or not to round up to the nearest even number (true) or down to the nearest even number (false).

// Script by MaxLos :)
//--------------------------------------------------------------------------------------------------------------------------------------
function value_round_even(value, round_up)
{
	if (value = 0) return 0;
	
	value = floor(value);
	var value_is_even = ( (value mod 2) = 0);
	
	if (value_is_even) 
	{
		if (round_up) return value + 2;
		else return value;
	}
	else
	{
		if (round_up) return value + 1;
		else          return value - 1;
	}
}