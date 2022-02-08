///@function string_bool(value);

// Turns a value into boolean ('true' or 'false'), then returns that boolean as a string. 

/// @peram value	The value to return as a boolean string.

// Script by MaxLos :)
//---------------------------------------------------------------------------------------
function string_bool(value)
{
	if (value >= 0.5) return "true"; else return "false";
}