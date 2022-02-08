///@function draw_ds_map(x, y, y space, map, "map", font [optional])

// Draws all the keys and it's values contained in a ds map. Should be used for debugging purposes only.
// - If the map is empty, "Empty map!" will be drawn instead.
// - If the variable doesn't contain a map, "Variable doesn't contain a ds map!" will be drawn instead.

/// @peram x			The x coordinates to draw the map.
/// @peram y			The y coordinates to draw the map.
/// @peram y space		The vertical spacing between each drawn key/value in the map. Set to -1 to automatically space each drawn key/value, based on the size of the current font.
/// @peram map			The ds map to draw.
/// @peram "map"		The name of the ds map to draw, as a string.
/// @peram font			The font to draw this information in. Optional; leave this argument blank to draw with the currently active font.

// Example: draw_ds_map(0, 0, -1, my_ds_map, "my_ds_map", fnt_debug);

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_ds_map(xx, yy, y_space, map, map_name)
{
	if !ds_exists(map, ds_type_map)	draw_text(xx, yy, "Variable doesn't contain a ds map!")
	else
	{
		if (argument_count >= 6) 
		{
			var current_font = draw_get_font();
			draw_set_font(argument[5]);
		}
		var size = ds_map_size(map);
		if (size = 0) draw_text(xx, yy, "Empty map!");
		else
		{
			var actual_y_space = y_space;
			var first_key = ds_map_find_first(map);
			var current_key = first_key;
			var current_value = string(ds_map_find_value(map, current_key));
			for (var i = 0; i < size; i ++;)
			{
				var text = map_name + "[\"" + string(current_key) + "\"][" + string(current_value) + "]";
				if !(current_key = first_key) and (y_space = -1)
				{
					var last_key = ds_map_find_previous(map, current_key);
					var last_value = ds_map_find_value(map, last_key)
					var last_text = map_name + "[\"" + string(last_key) + "\"][" + string(last_value) + "]";
					actual_y_space = string_height(last_text);
				}
				draw_text(xx, yy + (actual_y_space * i), text);
				current_key = ds_map_find_next(map, current_key);
				current_value = string(ds_map_find_value(map, current_key));
			}
		}
		if (argument_count >= 6) draw_set_font(current_font);
	}
}