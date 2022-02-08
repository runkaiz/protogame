///@function string_is_real(string) 

// Returns whether or not a string can be converted into a real number (true or false).
// It works similarly to 'real()' but will not crash the game if the checked string cannot be converted to a real number.
// This script does NOT account for any operational signs that may be in the string like addition (+), subtraction (-), and so on,
// so if those signs are present in the string this will return 'false'.

/// @peram string	The string to check 

// Example: if (string_is_real(textbox_text)) { *do something * }

// Script by MaxLos :)
//--------------------------------------------------------------------------------------------------------------------------------
function string_is_real(String)
{
	var String_length = string_length(String)
	var String_length_digits = string_length(string_digits(String));
	
	if !(String_length = String_length_digits) return false;
	else return true;
}

