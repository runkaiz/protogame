///@function draw_set_default(halign? [optional], valign? [optional], color? [optional], font? [optional], circle_precision? [optional])

// Allows you to set multiple drawing settings to their default values.

/// @peram halign?				Whether or not to set the horizontal alignment of drawn text to it's default value (fa_left).
///								Optional; leave this argument blank or set it to 'undefined' to set the horizontal alignment of text to it's default settings.
								
/// @peram valign?				Whether or not to set the vertical alignment of drawn text to it's default value (fa_top).
///								Optional; leave this argument blank or set it to 'undefined' to set the vertical alignment of drawn text to it's default settings.
								
/// @peram color?				Whether or not to set the color of drawn shapes or text to it's default color (c_white).
///								Optional; leave this argument blank or set it to 'undefined' to set the color of drawn text to it's default color.
								
/// @peram font?				Whether or not to set the font used for drawning to it's default value (-1).
///								Optional; leave this argument blank or set it to 'undefined' to set the font used for drawing to the default font.

/// @peram circle precision?	Whether or not to set precision circles will be drawn with to it's default value (24). 
///								Optional; leave this argument blank or set it to 'undefined' to set the precision circles will be drawn with to it's default value.

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_set_default(halign = true, valign = true, color = true, font = true, circle_precision = true)
{
	if (argument_count > 0) and (argument[0] or argument[0] = undefined)   draw_set_halign(fa_left);
	if (argument_count > 1)	and (argument[1] or argument[1] = undefined)   draw_set_valign(fa_top);
	if (argument_count > 2) and (argument[2] or argument[2] = undefined)   draw_set_color(c_white);
	if (argument_count > 3) and (argument[3] or argument[3] = undefined)   draw_set_font(-1);
	if (argument_count > 4) and (argument[4] or argument[4] = undefined)   draw_set_circle_precision(24);
}
