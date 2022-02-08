///@function draw_sprite_to_surface(x, y, sprite, subimg, surface, ignore x offset?, ignore y offset?)

// Draws a sprite to an existing surface. You do not have to check if the surface exists before drawing to it,
// nor make sure it's already being targeted; these will be done for you.

/// @peram x					The x coordinate to draw the sprite.
/// @peram y					The y coordinate to draw the sprite.
/// @peram sprite				The sprite to draw to the surface.
/// @peram subimg				The subimage to draw the sprite with.
/// @peram surface				The surface to draw the sprite to.
/// @peram ignore x offset?		Whether or not to ignore the x offset of the sprite when drawing it to the surface, treating it as if it was set to 0.
/// @peram ignore y offset?		Whether or not to ignore the y offset of the sprite when drawing it to the surface, treating it as if it was set to 0.

// Example: draw_sprite_to_surface(0, 0, spr_sprite, 0, gui_surface, false, false);

// Script by MaxLos :)
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_sprite_to_surface(xx, yy, sprite, subimage, surface, ignore_x_offset, ignore_y_offset)
{
	var sprite_x_offset = sprite_get_xoffset(sprite), sprite_y_offset = sprite_get_yoffset(sprite);

	var draw_x = xx - (sprite_x_offset * ignore_x_offset), draw_y = yy - (sprite_y_offset * ignore_y_offset);
	
	var original_surface_target = surface_get_target();
	if (surface_exists(surface))
	{
		if !(original_surface_target = surface) 
		{
			if !(original_surface_target = -1) surface_reset_target();
			surface_set_target(surface);
		}
		draw_sprite(sprite, subimage, draw_x, draw_y);
		surface_reset_target();
		if !(original_surface_target = -1) surface_set_target(original_surface_target);
	}
}