///@function draw_ds_grid(x, y, x space, y space, grid, "grid", font [optional])

// Draw all the values in a ds_grid as text. Should be used for debugging purposed only.
// If the variable that supposedly contains a ds_grid doesn't actually contain one, "Variable isn't a ds grid!" will be drawn instead.

// @param x		       The starting x coordinates to draw the grid.
// @param y			   The starting y coordinates to draw the grid.
// @param x space	   The horizontal spacing between each drawn column. Set to -1 to automatically space each drawn column for you.
// @param y space	   The vertical spacing between each drawn row. Set to -1 to automatically space each drawn row for you.
// @param grid		   The ds grid to draw.
// @peram "grid"	   The name of the ds grid to draw (as a string)
// @peram font         The font to draw the ds grid with. Optional; leave blank to use the currently set font.

// Example: draw_ds_grid(0, 0, -1, -1, my_grid, "my_grid", fnt_debug)

// Script by MaxLos :)
//---------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_ds_grid(xx, yy, x_space, y_space, grid, grid_name) 
{
	if !(ds_exists(grid, ds_type_grid)) draw_text(xx, yy, "Variable isn't a ds grid!");
	else
	{
		var current_font = draw_get_font();
		if (argument_count >= 7) draw_set_font(argument[6]);
		
		var grid_width  = ds_grid_width(grid);
		var grid_height = ds_grid_height(grid);
		
		for (var i = 0; i < grid_height; i ++;)
		{
			for (var h = 0; h < grid_width; h ++;)
			{
				var actual_y_space = y_space;
				if (i > 0) and (y_space = -1)
				{
					var last_row_text = string(ds_grid_get(grid, 0, i - 1));
					actual_y_space = string_height(last_row_text);
				}
				
				var actual_x_space = x_space;
				if (h > 0) and (x_space = -1)
				{
					var widest_text = 0;
					for (var j = 0; j < grid_height; j ++;)
					{
						var column_text = grid_name + "[" + string(i) + "," + string(h) + "]:" + string(ds_grid_get(grid, h - 1, j))
						widest_text = max(widest_text, string_width(column_text));
					}
					actual_x_space = widest_text + (widest_text * 0.2);
				}
				var text = grid_name + "[" + string(i) + "," + string(h) + "]:" + string(ds_grid_get(grid, h, i))
		        draw_text(xx + (h * actual_x_space), yy + (i * actual_y_space), text);
			}
		}
		draw_set_font(current_font);
	}
}
