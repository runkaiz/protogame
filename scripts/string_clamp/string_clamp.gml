///@function string_clamp(string, max)

// Clamps a string so it's character length does not go above a given max value;
// characters at the end of the clamped string will be deleted if the string goes above it's max character length.

/// @peram string		The string to clamp.
/// @peram max			The maximum character length the string is allowed to be.

// Example: inputbox_string = string_clamp(inputbox_string, 5); // Clamp the string contained in the variable 'inputbox_string' 
															    // so it's character length can't exceed 5 characters.

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------------------
function string_clamp(String, Max)
{
	var len = string_length(String);
	if (len > Max) String = string_delete(String, Max + 1, len);
	return String;
}

