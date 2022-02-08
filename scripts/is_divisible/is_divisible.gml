///@function is_divisible(value, divisor)

// Returns whether or not a value is divisible by another value (with no remainder).
// (Also, keep in mind that 0 is divisible by any interger number)

// Example: if (is_divisible(HP, 2)) { *do something* }

// Script by MaxLos :)
//--------------------------------------------------------------------------------------
function is_divisible(value, divisor)
{
	if ((value mod divisor) = 0) return true; else return false;
}