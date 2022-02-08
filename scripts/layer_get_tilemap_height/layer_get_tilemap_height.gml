///@function layer_get_tilemap_height("layer name" or layer id)

// Returns how many cells of a tilemap can fit in the current room, vertically.

/// @peram "layer name" or layer id		The layer name or id of the layer.

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------
function layer_get_tilemap_height(layer_name_or_layer_id)
{
	if (is_string(layer_name_or_layer_id)) layer_name_or_layer_id = layer_get_id(layer_name_or_layer_id);
	
	var tilemap = layer_tilemap_get_id(layer_name_or_layer_id);
	var tilemap_width = tilemap_get_height(tilemap)
	return tilemap_width;
}