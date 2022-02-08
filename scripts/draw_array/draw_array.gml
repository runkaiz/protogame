///@function draw_array(x, y, x space, y space, array, "array", font [optional])

// Draws all values in an array at the specified x and y coordinates. Should be used for debugging purposes only.
// - Can only draw arrays that have up to 3 dimensions. 
// - If the array trying to be drawn isn't actually an array, "variable isn't an array!" will be drawn instead.

/// @peram x			    The x coordinate these values should be drawn at.
/// @peram y			    The starting y coordinate these values should be drawn at. 
/// @peram x space			The horizontal spacing between drawn values in different dimensions. Only applicable when drawing an array with multiple dimensions.
/// @peram y space		    The vertical spacing between each drawn value. Set to this argument to 'undefined' or leave it blank to automatically space these values based on their height.
/// @peram array			The array you want to draw.
/// @peram "array"		    The name of the array (as a string, see below example)
/// @peram font				The font to draw this information in. Optional; leave this argument blank or set it to 'undefined' to draw with the currently set font.

// Example: draw_array(0, 0, 20, 20, my_array, "my_array", fnt_debug);

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_array(xx, yy, x_space, y_space, array, array_name, font = draw_get_font())
{	
	if !is_array(array) draw_text(xx, yy, "variable isn't an array!");
	else
	{
		var current_font = draw_get_font(); draw_set_font(font);
		
		var length = array_length(array);
		var dimensions = 0;
		var array_string = string(array);
		var original_yy = yy;
		
		for (var i = string_length(array_string); i > 1; i --;)
		{
			var char = string_char_at(array_string, i);
			if (string_length(string_digits(char)) != 0) break;
			if (char = "]") dimensions ++;
		}
		
		if (dimensions = 1)
		{	
			var actual_y_length = y_space;
			for (var i = 0; i < length; i ++;)
			{
				var text = array_name + "[" + string(i) + "]" + ":" + string(array[i]);
				
				if (actual_y_length = undefined) and (i > 0)
				{
					var last_text = array_name + "[" + string(i-1) + "]" + ":" + string(array[i-1]);
					actual_y_length = string_height(last_text);
				}
				
				draw_text(xx, yy + (actual_y_length * i), text);
			}
		}
		else if (dimensions = 2)
		{	
			var y_length = array_length(array), actual_y_space = y_space;
			for (var i = 0; i < y_length; i ++;)
			{
				var x_length = array_length(array[i]);
				var max_text_width = 0;
				for (var h = 0; h < x_length; h ++;)
				{
					var text = array_name + "[" + string(i) + "][" + string(h) + "]" + ":" + string(array[i][h]);
					draw_text(xx, yy, text);
					
					y_space = actual_y_space;
					if (y_space = undefined) y_space = string_height(text);
					
					yy += y_space;
					max_text_width = max(string_width(text), max_text_width);
				
				}
				xx += max_text_width + x_space;
				yy = original_yy;
			}
		}
		else if (dimensions = 3)
		{
			var x_length = array_length(array);
			var horizontal_space = 0, vertical_space = 0, max_text_width = 0, actual_y_space = y_space;
			for (var i = 0; i < x_length; i ++;)
			{
				vertical_space = 0;
				
				var y_length = array_length(array[i]);
				for (var h = 0; h < y_length; h ++;)
				{
					var z_length = array_length(array[i][h]);
					for (var j = 0; j < z_length; j ++;)
					{
						var text = array_name + "[" + string(i) + "][" + string(h) + "][" + string(j) + "]:" + string(array[i][h][j]);
						var text_width = string_width(text);
						max_text_width = max(text_width, max_text_width);
						
						draw_text(xx + horizontal_space + (i * 40), yy + vertical_space, text);
					
						y_space = actual_y_space;
						if (y_space = undefined) y_space = string_height(text);
						
						vertical_space += y_space;
						if (j = z_length - 1) vertical_space += y_space;
					}
				}
				horizontal_space += max(horizontal_space, max_text_width);
				max_text_width = 0;
				
			}
		}

		draw_set_font(current_font);
	}
}