///@function layer_get_instances("layer name" or layer id)

// Returns a 1d array containing the instance ids of all the instances on a layer.
// If no instances could be found, '-1' will be returned instead.

/// @peram "layer name" or layer id		The layer name or id of the layer to get the instances ids of.

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------
function layer_get_instances(layer_name_or_id)
{
	var array = array_create(0);
	if (is_string(layer_name_or_id)) layer_name_or_id = layer_get_id(layer_name_or_id);
	with (all)
	{
		if (layer = layer_name_or_id) array_push(array, id);
	}
	if (array_length(array) = 0) array = -1;
	return array;
}

