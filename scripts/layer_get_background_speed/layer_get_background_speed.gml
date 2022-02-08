///@function layer_get_background_speed(layer id or "layer_name")

// Returns the animation speed of the background on a layer.
// You could already do this without this script, but this saves you the time of having to get the layer id, 
// then getting the background id from the layer id, and then finally checking the background id to get the animation speed.

/// @peram layer id or "layer name"		The id or layer name of the layer.

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------
function layer_get_background_speed(layer_id_or_layer_name)
{
	if (is_string(layer_id_or_layer_name)) layer_id_or_layer_name = layer_get_id(layer_id_or_layer_name);
	
	var layer_background_id     = layer_background_get_id(layer_id_or_layer_name);
	var layer_background_spd    = layer_background_get_speed(layer_background_id);
	return layer_background_spd;
}