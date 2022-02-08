/// @function string_insert_quotes(string)

// Returns a copy of a string with quotation marks inserted at the beginning and end of that string.

/// @peram string		The string to insert quotation marks.

// Example: var hello_with_quotes = string_insert_quotes("Hello");

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------
function string_insert_quotes(String)
{
	var len = string_length(String);
	String = string_insert("\"", String, len + 1);
	String = string_insert("\"", String, 1);
	return String;
}