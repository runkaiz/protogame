///@function draw_ds_list(x, y, y space, list, "list", font[optional], pos_1 [optional], pos_2 [optional])

// Draw the values at all positions in a ds_list. Should be used for debugging purposed only.
// If the ds list is empty, "Empty list!" will be drawn instead.
// If the variable doesn't contain a ds list, "variable doesn't contain a ds list!" will be drawn instead.

// @param x            The x coordinate to draw this information at.
// @param y            The starting y coordinate to draw this information at.

// @param y space      The vertical spacing between each drawn value in the ds list. 
//					   You can set this argument to '-1' to automatically space each drawn value, based on the vertical size of the current font.

// @param list         The ds list to draw
// @peram "list"	   The name of the ds list (as a string)
// @peram font		   The font to draw this information in. Optional; leave blank to draw with the current active font

// @peram pos_1	       The first position in the ds list that contains the first value that should be drawn 
// @peram pos_2	       The final position in the ds list that contains the last value that should be drawn

// ^ The last two arguments are optional; leave them BOTH blank to draw all values in the ds list

// Example 1: draw_ds_list(0, 0, -1, my_list, "my_list");				   //Draw all values in 'my_list'
// Example 2: draw_ds_list(0, 0, -1, my_list, "my_list", fnt_debug, 2, 5)  //Draw the values from position 2 through 5 in 'my_list'

// Script by MaxLos :)
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_ds_list(xx, yy, y_space, list, list_name)
{
	var current_font = draw_get_font();
	
	if ds_exists(list, ds_type_list)
	{
		if (ds_list_empty(list)) draw_text(xx, yy, "Empty list!")
		else
		{
			if (argument_count >= 6) draw_set_font(argument[5]);
				
			var pos_1 = 0; 
			var pos_2 = ds_list_size(list) - 1;
			if (argument_count >= 8) 
			{
				pos_1 = argument[6];
				pos_2 = argument[7];
			}
			
			var h = 0;
			for (var i = pos_1; i <= pos_2; i ++;)
			{
				var text = list_name + "(" + string(i) + "): " + string(ds_list_find_value(list, i));
				if (i > 0) var last_text = string(ds_list_find_value(list, i - 1));
				var actual_spacing = y_space;
				if (y_space = -1) and (i > 0) actual_spacing = string_height(last_text);
			
			    draw_text(xx, yy + (actual_spacing * h), text);
				h ++;
			}
		}
	}
	else draw_text(xx, yy, "variable doesn't contain a ds list!");
	
	draw_set_font(current_font);
}
