///@function window_is_minimized()

// Returns whether or not the window is currently minimized.

//Example: if (window_is_minimized()) scr_game_pause();

// Script by MaxLos :)
//---------------------------------------------------------------------------------------
function window_is_minimized()
{
	var window_width = window_get_width();
	var window_height = window_get_height();
	
	if (window_width = 0) and (window_height = 0) return true; else return false;
}