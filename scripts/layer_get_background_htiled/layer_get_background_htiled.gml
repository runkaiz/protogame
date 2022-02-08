///@function layer_get_background_htiled(layer id or "layer name")

// Returns whether or not the background of a layer is being horizontally tiled or not.
// You could already do this without this script, but this saves you the time of having to get the layer id, 
// then getting the background id from the layer id, and then finally checking the background id to see whether or not it's 
// horizontally tiled.

/// @peram layer id or "layer name"		The id or layer name of the layer.

// Script by MaxLos :)
//--------------------------------------------------------------------------------------------------------------------------------
function layer_get_background_htiled(layer_id_or_layer_name)
{
	if (is_string(layer_id_or_layer_name)) layer_id_or_layer_name = layer_get_id(layer_id_or_layer_name);
	
	var layer_background_id    = layer_background_get_id(layer_id_or_layer_name);
	var layer_background_h     = layer_background_get_htiled(layer_background_id);
	return layer_background_h;
}