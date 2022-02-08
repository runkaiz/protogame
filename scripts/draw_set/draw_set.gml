///@function draw_set(halign [optional], valign [optional], color [optional], font [optional])

// Allows you to set multiple draw settings.

/// @peram halign	The horizontal alignment to set text to be drawn with. (Optional)
/// @peram valign   The vertical alignment to set text to be drawn with. (Optional)
/// @peram color	The color to set text to be drawn with. (Optional)
/// @peram font		The font to set text to be drawn with. (Optional)

// Script by MaxLos :)
//--------------------------------------------------------------------------------------------------
function draw_set(halign, valign, color, font)
{
	if !(halign = undefined) draw_set_halign(halign);
	if !(valign = undefined) draw_set_halign(valign);
	if !(color = undefined)  draw_set_color(color);
	if !(font = undefined)   draw_set_font(font);
}