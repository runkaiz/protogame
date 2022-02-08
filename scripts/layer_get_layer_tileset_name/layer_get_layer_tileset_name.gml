///@function layer_get_tileset_name("layer name" or layer id)

// Returns the asset name of the tileset that has been assigned to the tilemap of a layer.

/// @peram "layer name" or layer id		The layer name or layer id of the layer.

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------
function layer_get_tileset_name(layer_name_or_layer_id)
{
	if (is_string(layer_name_or_layer_id)) layer_name_or_layer_id = layer_get_id(layer_name_or_layer_id);
	
	var tilemap = layer_tilemap_get_id(layer_name_or_layer_id);
	var tileset = tilemap_get_tileset(tilemap)
	var tileset_name = tileset_get_name(tileset);
	
	return tileset_name;
}