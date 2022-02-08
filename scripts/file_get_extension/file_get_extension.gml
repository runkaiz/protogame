///@function file_get_extension(file name)

// Returns the extension of a file (as a string). This is done by removing all the characters to the left of the final '.' character.
// This function will return an empty string if the file has no extension. 

/// @peram file name		The name of the file.

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------------------------
function file_get_extension(file_name)
{
	var extension = "", len = string_length(file_name), dot_pos = string_last_pos(".", file_name);
	if (dot_pos = 0) or (dot_pos = len) return extension;
	else
	{
		extension = string_delete(file_name, 1, dot_pos - 1);
		return extension;
	}
}