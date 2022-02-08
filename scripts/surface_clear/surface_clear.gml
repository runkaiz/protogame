///@function surface_clear(surface)

// Clears a surface. The surface will checked to see if it exists first before clearing it.

///@peram surface   The surface to clear.

// Example: surface_clear(gui_surface);

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------
function surface_clear(surface) 
{	
	if surface_exists(surface)
	{
		var original_surface_target = surface_get_target();
		if !(original_surface_target = -1) surface_reset_target();
	    surface_set_target(surface); draw_clear_alpha(c_white, 0);
	    surface_reset_target();
		if !(original_surface_target = -1) surface_set_target(surface);
	}
}

