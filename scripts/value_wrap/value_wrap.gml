///@function value_wrap(value, low_margin, high_margin)

// Wraps a value around if they exceed or go below the given margins.

/// @peram value         The value to wrap.
/// @peram low_margin    If the value goes below this margin, it will be wrapped around to the high margin.
/// @peram high_margin   If the value goes above this margin, it will be wrapped around to the low margin.

// Example: menu_position = value_wrap(menu_position, 0, menu_height);

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------
function value_wrap(value, low_margin, high_margin) 
{
	if (value < low_margin)  value = high_margin;
	if (value > high_margin) value = low_margin;
	return value;
}
