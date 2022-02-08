///@function camera_get_view_y_ext(camera id, position, y [optional])

// Returns the y coordinate of the left, center, or right position that a camera would be located at if it were at a given y coordinate.

/// @peram camera id	The id of the camera.
/// @peram position		The position to get the x coordinate of. This argument can be 'fa_top', 'fa_center', or 'fa_bottom'.
/// @peram y			The y position of the camera to base the check off of. Optional; you can leave this argument blank and it will default to the current y position of the camera.

// var camera_center_y = camera_get_view_y_ext(view_camera[0], fa_center);

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function camera_get_view_y_ext(cam, position)
{
	var cam_y = camera_get_view_y(cam);
	if (argument_count > 2) cam_y = argument[2];
	
	var cam_height = camera_get_view_height(cam);
	
	if (position = fa_left)   return cam_y;
	if (position = fa_center) return cam_y + floor(cam_height/2);
	if (position = fa_right)  return (cam_y + cam_height) - 1;
}

