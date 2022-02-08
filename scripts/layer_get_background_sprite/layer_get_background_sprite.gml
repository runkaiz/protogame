///@function layer_get_background_sprite(layer id or "layer name")

// Returns sprite index of the sprite that is currently being used as a background for a layer.
// You could already do this without this script, but this saves you the time of having to get the layer id, 
// then getting the background id from the layer id, and then finally getting the sprite index from the background id.

/// @peram layer id or "layer name"		The id or layer name of the layer.

// Script by MaxLos :)
//-----------------------------------------------------------------------------------------------------------------------------
function layer_get_background_sprite(layer_id_or_layer_name)
{
	if (is_string(layer_id_or_layer_name)) layer_id_or_layer_name = layer_get_id(layer_id_or_layer_name);
	
	var layer_background_id               = layer_background_get_id(layer_id_or_layer_name);
	var layer_background_sprite_index     = layer_background_get_sprite(layer_background_id);
	return layer_background_sprite_index;
}