///@function outside_room(id or object or sprite or element, check type, fully outside room?, [sprite or element x], [sprite or element y], [sprite or element width], [sprite or element height])

// Similar to the 'Outside Room' event, this returns whether or not an instance, object, or drawn sprite or element is outside the bounds of the current room.
// If you check for an object and there are multiple instances with that object index, this will return 'true' if any of them are outside the room.
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//																				Arguments

/// @peram id or object or sprite or element 	The id or object or sprite or element to check. 
///												If checking an element (a drawn shape using one of the built-in draw functions, for example) you must set this argument to '-1'.
												
/// @peram check type							What the check will be based off of. 
///												This argument can be one of the following values and is only applicable when checking if an instance or object is outside the room:
///												
///												0 - The check will be based off of the instance's or object(s)' x/y origin.
///												1 - The check will be based off of the instance's or object(s)' sprite index (including any transparent/empty space within the sprite).
///												2 - The check will be based off of the instance's or object(s)' bounding box.
																		
/// @peram fully outside room?					Whether or not to check if the instance or object(s) are 'fully' outside the room, i.e, the instance or object's
///												entire sprite or bounding box are outside the room. This argumenet is only applicable if 'check type' was set to '1' or '2'.

// The following optional arguments are only applicable when checking if a drawn sprite or element is outside the bounds of the room:

/// @peram sprite or element x					The x coordinate the sprite or element is being drawn at.
/// @peram sprite or element y					The y coordinate the sprite or element is being drawn at.
												
/// @peram sprite or element width				The width of the sprite or element that is being drawn.  
///												Optional; if checking a sprite, you can leave this argument blank to have it default to the width of the sprite being checked.
												
/// @peram sprite or element height				The height of the sprite or element that is being drawn. 
///												Optional; if checking a sprite, you can leave this argument blank to have it default to the height of the sprite.
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//																			   Usage Examples

// Example 1: if outside_room(id, 1, true)														  //Check if the calling instance is fully outside the room
																								  
// Example 2: if outside_room(obj_enemy, 1, false)												  //Check if any enemies are partially outside the room
																								  
// Example 3: if outside_room(spr_sprite0, 1, false, sprite_x, sprite_y)						  //Check if a drawn sprite is partially outside the room

// Example 4: if outside_room(-1, 1, false, element_x, element_y, element_width, element_height); //Check if a drawn element is partially outside the room

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function outside_room(id_or_object_or_sprite, check_type, fully_outside_room, sprite_or_element_x, sprite_or_element_y, sprite_or_element_width, sprite_or_element_height)
{
	var checking_object_or_instance = (argument_count < 4)
	
	if (checking_object_or_instance)
	{
		with (id_or_object_or_sprite)
		{
			if (check_type = 0) 
			{
				if (x < 0 or x > room_width or y < 0 or y > room_height) return true;
			}
		
			else if (check_type = 1)
			{
				if !(sprite_index = -1)
				{
					var spr_x_origin = sprite_get_xoffset(sprite_index), spr_y_origin = sprite_get_yoffset(sprite_index);
					var spr_left_x = x - spr_x_origin, spr_right_x = spr_left_x + (sprite_get_width(sprite_index) - 1);
					var spr_top_y  = y - spr_y_origin, spr_bottom_y = spr_top_y + (sprite_get_height(sprite_index) - 1);
					
					if !(fully_outside_room)
					{
						if (spr_left_x < 0 or spr_right_x > room_width or spr_top_y < 0 or spr_bottom_y > room_height) return true;
					}
					
					else if (fully_outside_room) 
					{
						if ( (spr_left_x < 0 or spr_left_x > room_width)  and (spr_right_x  < 0 or spr_right_x  > room_width) )
					    or ( (spr_top_y  < 0 or spr_top_y  > room_height) and (spr_bottom_y < 0 or spr_bottom_y > room_height) )
						{
							   return true;
						}
					}
				}
			}
			else if (check_type = 2) 
			{
				if !(fully_outside_room)
				{
					if (bbox_left < 0) or (bbox_right > room_width) or (bbox_top < 0) or (bbox_bottom > room_height) return true;
				}
				
				else if (fully_outside_room) 
				{
					if (bbox_left > room_width) or (bbox_right < 0) or (bbox_top > room_height) or (bbox_bottom < 0) return true;
				}
			}
		}
		return false;	
	}
	else
	{
		var spr = id_or_object_or_sprite;
		
		if (sprite_or_element_width = undefined) and !(spr = -1) sprite_or_element_width = sprite_get_width(spr);
		var width = sprite_or_element_width;
		
		if (sprite_or_element_height = undefined) and !(spr = -1) sprite_or_element_height = sprite_get_height(spr);
		var height = sprite_or_element_height;
		
		var xx = sprite_or_element_x, spr_left_x = xx - sprite_get_xoffset(spr), spr_right_x  = spr_left_x + (width - 1);
		var yy = sprite_or_element_y, spr_top_y = yy - sprite_get_yoffset(spr),  spr_bottom_y = spr_top_y  + (height - 1);
		
		if !(fully_outside_room) 
		{
			if (spr_left_x < 0) or (spr_right_x > room_width) or (spr_top_y < 0) or (spr_bottom_y > room_height) return true;
		}
		else if (fully_outside_room)
		{
			if (spr_left_x > room_width) or (spr_right_x < 0) or (spr_top_y > room_height) or (spr_bottom_y < 0) return true;
		}
	}
}