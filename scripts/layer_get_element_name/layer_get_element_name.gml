///@function layer_get_element_name(element id)

// Returns the asset name of an layer element. If the element no longer exists or is unknown, "???" will be returned instead.

/// @peram element id		The id of the element.

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------------
function layer_get_element_name(element_id)
{
	var element_type = layer_get_element_type(element_id), element_name = "";
	switch (element_type)
	{
		case layerelementtype_sprite:
		{
			var element_sprite = layer_sprite_get_sprite(element_id);
			element_name = sprite_get_name(element_sprite);
			return element_name;
		}
		
		case layerelementtype_background:
		{
			var element_background = layer_background_get_sprite(element_id);
			element_name = sprite_get_name(element_background);
			return element_name;
		}
		
		case layerelementtype_instance:
		{
			var element_instance = layer_instance_get_instance(element_id);
		
			var instance_object_index = element_instance.object_index;
			element_name = object_get_name(instance_object_index);
			return element_name;
		}
		
		default: return "???";
	}
}