///@function layer_is_temporary(layer id)

// Returns whether or not a layer is a temporary one (instances who's depth is manually set (example: depth = 100) are moved to temporary layers).

// Example: if (layer_is_temporary(layer)) { *do something* }

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------------------------------------
function layer_is_temporary(layer_id)
{
	if (layer_id = -1) return true; else return false;
}

