///@function sprite_get_if_bboxkind_is_rectangular(sprite)

// Returns whether or not the shape of the bounding box of a sprite is rectangular or not.

/// @peram sprite	The sprite whose bounding box to check the shape of.

// Example: var mask_is_rectangular = sprite_get_if_bboxkind_is_rectangular(sprite_index);

// Script by MaxLos :)
//---------------------------------------------------------------------------------------------
function sprite_get_if_bboxkind_is_rectangular(sprite)
{
	var original_mask = mask_index;
	mask_index = sprite;
	var bbox_width = bbox_right - bbox_left;
	
	for (var i = 0; i < bbox_width; i ++;)
	{
		if !collision_point(bbox_left + i, bbox_top, id, true, false) 
		{
			mask_index = original_mask;
			return false;
		}
	}
	
	mask_index = original_mask;
	return true;
}