///@function string_char_is_digit(string, index)

// Returns whether or not a character in a string is a digit or not.

/// @peram string		The string to check.
/// @peram index		The position to get the character from.

// Example: if (string_char_is_digit(keyboard_string, string_length(keyboard_string)) { * do something * }

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------
function string_char_is_digit(String, position)
{
	var char = string_char_at(String, position)
	if ( string_length(char) = string_length(string_digits(char)) ) return true; else return false;
}

