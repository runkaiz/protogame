///@function tileset_exists(index)

// Returns whether or not a tileset with the specified index exists or not.

/// @peram index		The index of the tileset to check

// Example: var	tiles_exist = tileset_exists(0);

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------
function tileset_exists(index)
{
	return (tileset_get_name(index) != "<undefined>");
}

