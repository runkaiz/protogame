///@function draw_rectangle_over_screen(color [optional], alpha [optional])

// Draws a rectangle over the entire screen. Should be called from one of the Draw GUI Events only.

/// @peram color	The color to draw the rectangle with. 
///					Optional; leave blank or set to 'undefined' to draw with the currently set draw color.

/// @peram alpha	The transparency to draw the rectangle with. 
///					Optional; leave blank or set to 'undefined' to draw with the currently set draw alpha.

// Script by MaxLos :)
//--------------------------------------------------------------------------------------------------------------
function draw_rectangle_over_screen(color = draw_get_color(), alpha = draw_get_alpha())
{
	var original_color = draw_get_color(), original_alpha = draw_get_alpha();
	
	draw_set_color(color); draw_set_alpha(alpha);
	var x1 = 0, x2 = window_get_width(), y1 = 0, y2 = window_get_height();
	draw_rectangle(x1, y1, x2, y2, false);
	
	draw_set_color(original_color); draw_set_alpha(original_alpha);
}