///@function random_color()

// Returns a random color. 
// * Make sure to call 'randomize()' somewhere in your game at least once before using this script.

// Example: var color = random_color();

// Script by MaxLos :)
//--------------------------------------------------------------------------------------------------
function random_color()
{
	return make_color_rgb(irandom(255), irandom(255), irandom(255));
}