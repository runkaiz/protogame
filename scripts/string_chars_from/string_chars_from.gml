///@function string_chars_from(string, pos 1, pos 2)

// Returns the characters at and from 2 positions in a string.
// (Remember that the position of the first character in a string is 1.)

/// @peram string	The string to pull the characters from
/// @peram pos 1    The first position
/// @peram pos 2    The second position

// Example: worl = string_chars_from("Hello world", 7, 10);

// Script by MaxLos :)
//----------------------------------------------------------------------------
function string_chars_from(String, pos_1, pos_2)
{
	var characters = "";
	for (var i = pos_1; i <= pos_2; i ++;)
	{
		var character = string_char_at(String, i);
		characters += character;
	}
	return characters;
}