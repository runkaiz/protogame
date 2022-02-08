///@function string_cut(string, position)

// Returns a string with all it's characters after a given position in the string removed.

/// @peram string	The string being cut
/// @peram position	The position in the string in which all characters that proceed it will be removed

// Example: Hello = string_cut("Hello world!", 5)

// Script by MaxLos :)
//------------------------------------------------------------------------------------
function string_cut(String, position)
{
	return string_delete(String, position + 1, string_length(String) - position + 1);
}