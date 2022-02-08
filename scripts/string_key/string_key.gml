///@function string_key(key);

// Checks a given key and returns it as a string.

/// @peram key		The key to check.

// Orignal script by L0v3, edited for GMS 2.3 by MaxLos :)
//------------------------------------------------------------------------------
function string_key(key)
{
	if (key = vk_left)          return "Left";
	if (key = vk_right)         return "Right";
	if (key = vk_up)            return "Up";
	if (key = vk_down)          return "Down";
	if (key = vk_enter)         return "Enter";
	if (key = vk_escape)        return "Escape";
	if (key = vk_space)         return "Space";
	if (key = vk_shift)         return "Shift";
	if (key = vk_control)       return "Control";
	if (key = vk_alt)		    return "Alt";
	if (key = vk_backspace)     return "Backspace";
	if (key = vk_tab)		    return "Tab";
	if (key = vk_home)	        return "Home";
	if (key = vk_end)		    return "End";
	if (key = vk_delete)        return "Delete";
	if (key = vk_insert)        return "Insert";
	if (key = vk_pageup)        return "Page Up";
	if (key = vk_pagedown)      return "Page Down";
	if (key = vk_pause)	        return "Pause";
	if (key = vk_printscreen)   return "Printscreen";
	if (key = vk_f1)			return "F1";
	if (key = vk_f2)			return "F2";
	if (key = vk_f3)			return "F3";
	if (key = vk_f4)			return "F4";
	if (key = vk_f5)			return "F5";
	if (key = vk_f6)			return "F6";
	if (key = vk_f7)			return "F7";
	if (key = vk_f8)			return "F8";
	if (key = vk_f9)			return "F9";
	if (key = vk_f10)			return "F10";
	if (key = vk_f11)		    return "F11";
	if (key = vk_f12)			return "F12";
	if (key = vk_numpad0)		return "Numpad 0";
	if (key = vk_numpad1)		return "Numpad 1";
	if (key = vk_numpad2)		return "Numpad 2";
	if (key = vk_numpad3)		return "Numpad 3";
	if (key = vk_numpad4)		return "Numpad 4";
	if (key = vk_numpad5)		return "Numpad 5";
	if (key = vk_numpad6)		return "Numpad 6";
	if (key = vk_numpad7)		return "Numpad 7";
	if (key = vk_numpad8)		return "Numpad 8";
	if (key = vk_numpad9)		return "Numpad 9";
	if (key = vk_multiply)      return "Multiply";
	if (key = vk_divide)		return "Divide";
	if (key = vk_add)			return "Add";
	if (key = vk_subtract)	    return "Subtract";
	if (key = vk_decimal)		return "Decimal";
	return chr(key);
}