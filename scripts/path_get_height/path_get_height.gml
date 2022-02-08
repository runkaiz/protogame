///@function path_get_height(path 1, point 1 [optional], path 2 [optional], point_2 [optional])

// Returns the height of a line from two points on a single path, or two different paths.
// The height returned is based on the room coordinates of the points on the path(s), so if checked path doesn't exist in the current room,
// a height of 1 will be returned.

/// @peram path 1		The first path.
						
/// @peram point 1		The index of the first point, from the first path.
/// @peram path 2		The second path (it can be the same as the first path)
/// @peram point 2		The index of second point, from the second path.

// ^ The last three arguments are optional; leave them ALL blank to get the height of the entire first path.

// Example 1: path_height = path_get_height(my_path);
// Example 2: path_height = path_get_height(my_first_path, 0, my_second_path, 1);

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------------------------------------------------
function path_get_height(path_1)
{
	if (argument_count >= 2)
	{
		var point_1 = argument[1];
		var path_2 = argument[2];
		var point_2 = argument[3];
		
		var point_1_y  = path_get_point_y(path_1, point_1);
		var point_2_y  = path_get_point_y(path_2, point_2);
		
		var path_height = abs(point_1_y - point_2_y);
	}
	else
	{
		var num_of_points = path_get_number(path_1);
		
		var lowest_point_y  = 999999999;
		var highest_point_y = -999999999; 
		
		for (var i = 0; i < num_of_points; i ++;)
		{
			var point_y = path_get_point_y(path_1, i);
			lowest_point_y = min(point_y, lowest_point_y);
			highest_point_y = max(point_y, highest_point_y);
		}
		var path_height = abs(lowest_point_y - highest_point_y);
	}
	
	return path_height;
}