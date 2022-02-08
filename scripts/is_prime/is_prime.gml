///@function is_prime(number, accuracy)

// Returns whether or not a number is a prime number.

/// @peram number	  The number to check

/// @peram accuracy	  The highest value to check that the number is divisible by. The higher number you set for this argument,
///					  the higher the chance of this script correctly returning true/false for the checked number.
///					  Must be a value of 9 or higher, but setting it to 9 should correctly return whether or not the number being checked is
///					  is a prime number most of the time.

// Example: if is_prime(score, 9) { *do something* }

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------------------
function is_prime(number, accuracy)
{
	if      (number = 2) return true;
	else if (number = 0) or (number = 1) or (number mod 2 = 0) return false;			
	
	else
	{
		accuracy = clamp(accuracy, 9, accuracy);
		var len = min(number, accuracy);
		for (var i = 2; i <= len; i ++;)
		{
			if (number mod i = 0) and !(i = number) return false;
		}
		return true;
	}
}