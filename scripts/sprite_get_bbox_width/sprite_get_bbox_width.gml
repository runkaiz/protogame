///@function sprite_get_bbox_width(sprite [optional])

// Returns the width of the bounding box of a sprite.

/// @peram sprite	  The sprite to get the bbox width of.
///					  Optional; leave this argument blank to get the bbox width of the current sprite of the instance calling this script.

// Example 1: var bbox_width = sprite_get_bbox_width();                         //Get the bbox width of the calling instance's current sprite.
// Example 2: var bbox_width_crawl = sprite_get_bbox_width(spr_player_crawl);  //Get the bbox width of the sprite 'spr_player_crawl'.

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------------------------------
function sprite_get_bbox_width()
{
	var sprite;
	if (argument_count = 0) sprite = sprite_index;
	else					sprite = argument[0];
	
	if (sprite = -1) return 0;
	var right = sprite_get_bbox_right(sprite); var left = sprite_get_bbox_left(sprite);
	return (right - left) + 1;
	
}