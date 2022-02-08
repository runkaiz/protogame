///@function draw_line_accurate(x1, y1, x2, y2, color [optional], alpha [optional])

// Draws a line whose x and y coordinates will be consistant across different hardware. 

// A sprite, called 'spr_pixel', must exist in the IDE to use this script. 
// The sprite itself should be 1 x 1 sprite that is a single white pixel.

// This script cannot be used to draw diagonal lines; if you are drawing a horizontal line, the y coordinates will affect the 'thickness' of the line
// and vice versa for vertical lines, meaning you can also draw filled rectangles with this script as well.

// See the below topic for more information about the inconsistencies of drawing functions across different hardware:
// https://forum.yoyogames.com/index.php?threads/drawing-lines-not-recommended.18246/ 

/// @peram x1		The x coordinate of the left side of the line.
/// @peram y1		The y coordinate of the right of the line.
/// @peram x2		The x coordinate of the end of the line.
/// @peram y2		The y coordinate of the end of the line.

/// @peram color	The color to draw the line with. Optional; leave blank or set to 'undefined' to draw with currently set draw color.
/// @peram alpha	The alpha to draw the line at. Optional; leave blank or set to 'undefined' to draw with currently set draw alpha.

// Example: draw_line_accurate(0, 0, 100, 0);

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_line_accurate(x1, y1, x2, y2, color = draw_get_color(), alpha = draw_get_alpha())
{	
	var xscale = (abs(x2 - x1) + sign(x2 - x1) ) * sign(x2 - x1);
	if (xscale = 0) xscale ++;
	
	var yscale = (abs(y2 - y1) + sign(y2 - y1) ) * sign(y2 - y1);
	if (yscale = 0) yscale ++;
	
	draw_sprite_ext(spr_pixel, 0, x1, y1, xscale, yscale, 0, color, alpha);
}
