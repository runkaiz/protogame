///@function string_char_is_msc(string, index)

// Returns whether or not a character in a string is neither a character or digit.

/// @peram string		The string to check.
/// @peram index		The position to get the character from.

// Example: if (string_char_is_msc(keyboard_string, string_length(keyboard_string)) { * do something * }

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------
function string_char_is_msc(String, position)
{
	var char = string_char_at(String, position)
	if ( string_length(char) != string_length(string_lettersdigits(char)) ) return true; else return false;
}

