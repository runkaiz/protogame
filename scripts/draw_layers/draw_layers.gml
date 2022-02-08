///@function draw_layers(x, y, [x space], [y space], [font])

/// !!!											'layer_element_get_name()' is required to use this script!													 !!!

// Draws the names of all layers in the room and their elements. Intended use is for debugging purposes.

/// @peram x			The x coordinate to draw this information at.
/// @peram y			The y coordinate to draw this information at.

/// @peram x space		The horizontal spacing between each drawn section of information.
///						Optional; leave this argument blank or set it to 'undefined'  to have this argument be set to '30' by default.

/// @peram y space		The vertical spacing between each drawn element in a section.
///						Optional; leave this argument blank or set it to 'undefined' to have this argument be set to '5' by default.

/// @peram font			The font to draw this information in. Optional; leave this argument blank or set it to 'undefined' to draw with Gamemaker's default font.

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function draw_layers(xx, yy, x_space = 50, y_space = 5, font = -1)
{
	var original_font = draw_get_font(), original_halign = draw_get_halign(); draw_set_font(font); draw_set_halign(fa_left);
	var layers = layer_get_all(), num_of_layers = array_length(layers);
	with (all)
	{
		var found_one_instance = false;
		if (layer = -1) and !(found_one_instance)
		{
			found_one_instance = true;
			array_push(layers, -1);
			num_of_layers ++;
		}
	}
	
	for (var i = 0; i < num_of_layers; i ++;)
	{
		var this_layer = layers[i];
		var layer_elements, num_of_elements;
		if !(this_layer = -1) 
		{
			layer_elements = layer_get_all_elements(this_layer); 
			num_of_elements = array_length(layer_elements);
		}
		else
		{
			layer_elements = array_create(0);
			num_of_elements = 0;
		}
		
		var this_layer_name;
		if !(this_layer = -1) this_layer_name = layer_get_name(this_layer);
		this_layer_name = string_insert("\"", this_layer_name, 1); this_layer_name = string_insert("\"", this_layer_name, string_length(this_layer_name) + 1);
		this_layer_name += " Layer";
		if (this_layer = -1) this_layer_name = "Temporary Instance Layer";
		
		var layer_name_width = string_width(this_layer_name);
		
		var max_width = 0, rect_y1 = yy + string_height(this_layer_name), rect_y2 = rect_y1 + 3, drawn_element_y_pos = rect_y2 + 5;
		if (this_layer = -1)
		{
			var objects = array_create(0);
			with (all)
			{
				if (layer = -1)
				{
					var object_name = object_get_name(object_index);
					array_push(objects, object_name);
				}
			}
			
			var num_of_objects = array_length(objects);
			for (var h = 0; h < num_of_objects; h ++;)
			{
				var object_name = objects[h], object_name_width = string_width(object_name);
				max_width = max(max_width, object_name_width, layer_name_width);
				
				draw_text(xx, drawn_element_y_pos, "- " + object_name);
				drawn_element_y_pos += string_height(object_name) + y_space;
			}
		}
		else if (num_of_elements = 0) 
		{
			draw_text(xx, drawn_element_y_pos, "- No elements!");
			max_width = max(string_width("- No elements!"), layer_name_width);
		}
		
		for (var h = 0; h < num_of_elements; h ++;)
		{
			var element = layer_elements[h], element_name = layer_get_element_name(element), element_name_width = string_width(element_name);
			max_width = max(max_width, element_name_width, layer_name_width);
			
			draw_text(xx, drawn_element_y_pos, "- " + element_name);
			drawn_element_y_pos += string_height(element_name) + y_space;
		}
		
		var rect_x1 = xx, rect_x2 = rect_x1 + max_width;
		draw_rectangle(rect_x1, rect_y1, rect_x2, rect_y2, false);
		
		var text_x;
		if (layer_name_width < rect_x2 - rect_x1) text_x = rect_x2 - (rect_x2 - rect_x1)/2 - layer_name_width/2;
		else text_x = xx;
		
		draw_text(text_x, yy, this_layer_name);
		
		xx = rect_x2 + x_space;
	}
	
	draw_set_font(original_font); draw_set_halign(original_halign);
}

