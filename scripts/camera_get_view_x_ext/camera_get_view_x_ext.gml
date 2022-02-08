///@function camera_get_view_x_ext(camera id, position, x [optional])

// Returns the x coordinate of the left, center, or right position that a camera would be located at if it were at a given x coordinate.

/// @peram camera id	The id of the camera.
/// @peram position		The position to get the x coordinate of. This argument can be 'fa_left', 'fa_center', or 'fa_right'.
/// @peram x			The x position of the camera to base the check off of. Optional; you can leave this argument blank and it will default to the current x position of the camera.

// var camera_center_x = camera_get_view_x_ext(view_camera[0], fa_center);

// Script by MaxLos :)
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function camera_get_view_x_ext(cam, position)
{
	var cam_x = camera_get_view_x(cam);
	if (argument_count > 2) cam_x = argument[2];
	
	var cam_width = camera_get_view_width(cam);
	
	if (position = fa_left)   return cam_x;
	if (position = fa_center) return cam_x + floor(cam_width/2);
	if (position = fa_right)  return (cam_x + cam_width) - 1;
}

