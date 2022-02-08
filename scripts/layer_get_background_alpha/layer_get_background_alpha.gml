///@function layer_get_background_alpha(layer id or "layer name")

// Returns the alpha of a background layer.
// You could already do this without this script, but this saves you the time of having to get the layer id, 
// then getting the background id from the layer id, and then finally getting the alpha from the background id.

/// @peram layer id or "layer name"		The id or layer name of the layer.

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------
function layer_get_background_alpha(layer_id_or_layer_name)
{
	if (is_string(layer_id_or_layer_name)) layer_id_or_layer_name = layer_get_id(layer_id_or_layer_name);
	
	var layer_background_id    = layer_background_get_id(layer_id_or_layer_name);
	var layer_background_a	   = layer_background_get_alpha(layer_background_id);
	return layer_background_a
}