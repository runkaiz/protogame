///@function basic_movement(movement type, movement speed [optional])

// Gives basic movement to the calling instance. Purpose is for quick testing/debugging.

/// @peram movement type	     How the calling instance should move. This argument can be one of the following values:
///							     '0' - The instance will move via the arrow keys.
///							     '1' - The instance will move via the 'W', 'A', 'S', and 'D' keys.
///							     '2' - The instance will move towards the mouse.
							     
/// @peram movement speed	     How fast the instance will move. Only applicable if 'movement type' is set to the arrow or 'WASD' keys.
///								 Optional, will be '1' by default if left blank.

// Example 1: basic_movement(0, 5);
// Example 2: basic_movement(2);

// Script by MaxLos :)
//---------------------------------------------------------------------------------------------------------------------------------------------------------------
function basic_movement(movement_type, movement_speed = 1)
{
	if (movement_type = 0) or (movement_type = 1)
	{
		if (movement_type = 0)
		{
			var left = keyboard_check(vk_left), right = keyboard_check(vk_right), up = keyboard_check(vk_up), down = keyboard_check(vk_down);
		}
		else				   
		{
			var left = keyboard_check(ord("A")), right = keyboard_check(ord("D")), up = keyboard_check(ord("W")), down = keyboard_check(ord("S"))
		}
		
		var h_move = (right - left) * movement_speed, v_move = (down - up) * movement_speed;
		x += h_move; 
		y += v_move;
	}		
	else
	{
		x = mouse_x;
		y = mouse_y;
	}
}