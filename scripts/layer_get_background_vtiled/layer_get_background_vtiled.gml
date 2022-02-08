///@function layer_get_background_vtiled(layer id or "layer name")

// Returns whether or not the background of a layer is being vertically tiled or not.
// You could already do this without this script, but this saves you the time of having to get the layer id, 
// then getting the background id from the layer id, and then finally checking the background id to see if it's vertically tiled.

/// @peram layer id or "layer name"		The id or layer name of the layer.

// Script by MaxLos :)
//-----------------------------------------------------------------------------------------------------------------------------------
function layer_get_background_vtiled(layer_id_or_layer_name)
{
	if (is_string(layer_id_or_layer_name)) layer_id_or_layer_name = layer_get_id(layer_id_or_layer_name);
	
	var layer_background_id     = layer_background_get_id(layer_id_or_layer_name);
	var layer_background_v      = layer_background_get_vtiled(layer_background_id);
	return layer_background_v;
}