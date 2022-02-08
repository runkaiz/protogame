///@function sprite_get_bbox_height(sprite [optional])

// Returns the height of the bounding box of a sprite.

/// @peram sprite	  The sprite to get the bbox height of.
///					  Optional; leave this argument blank to get the bbox height of the current sprite of the instance calling this script.

// Example 1: var bbox_height = sprite_get_bbox_height();                            //Get the bbox height of the calling instance's current sprite.
// Example 2: var bbox_height_crouch = sprite_get_bbox_height(spr_player_crouch);    //Get the bbox height of the sprite 'spr_player_crouch'.

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------------------------------
function sprite_get_bbox_height()
{
	var sprite;
	if (argument_count = 0) sprite = sprite_index;
	else					sprite = argument[0];
	
	if (sprite = -1) return 0;
	var top = sprite_get_bbox_top(sprite); var bottom = sprite_get_bbox_bottom(sprite);
	return (bottom - top) + 1;
	
}