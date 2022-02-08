/// @description F11 for fullscreen
if keyboard_check_pressed(vk_f11) {
	if window_get_fullscreen() {
		window_set_fullscreen(false);
	}else{
		window_set_fullscreen(true);
	}
}

if textbox_exists() {
	if keyboard_check_pressed(vk_f7) {
		if textbox_backlog_visible() {
			textbox_show_backlog(false);
		}else{
			textbox_show_backlog(true);
		}
	}
}

/*You could use this code to hide the textbox when pressing esc. Or something other.
if textbox_exists() {
	if keyboard_check_pressed(vk_escape) {
		if textbox_is_visible() {
			textbox_hide(true);
		}else{
			textbox_hide(false);
		}
	}
}