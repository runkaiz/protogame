///@function path_get_length_ext(path 1, point 1, path 2, point 2)

// Similar to the built-in function 'path_get_length', but allows you to get the length of a line
// from two points on a single path, or two different paths, instead of only being able to get the entire
// length of a single path.

/// @peram path 1		The first path
/// @peram point 1		The index of the first point, from the first path
/// @peram path 2		The second path (it can be the same as the first path)
/// @peram point 2		The index of the second point, from the second path

// Example 1: var length = path_get_length_ext(my_path, 0, my_path, 1);
// Example 2: var length = path_get_length_ext(my_first_path, 0, my_second_path, 1);

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------
function path_get_length_ext(path_1, point_1, path_2, point_2)
{
	var point_1_x = path_get_point_x(path_1, point_1);
	var point_1_y = path_get_point_y(path_1, point_1);
	
	var point_2_x = path_get_point_x(path_2, point_2);
	var point_2_y = path_get_point_y(path_2, point_2);
	
	var temp_path = path_add();
	path_set_closed(temp_path, false);
	path_add_point(temp_path, point_1_x, point_1_y, 1);
	path_add_point(temp_path, point_2_x, point_2_y, 1);
	
	var length = path_get_length(temp_path);
	path_delete(temp_path);
	
	return length;
}
