///@description textbox_hide(visible?)
///@arg hide?
///Hides or shows the textbox
function textbox_hide(hide) {
	if hide == true {
		if instance_exists(textbox) {
			with(textbox) {
				textbox_visible = false;
				instance_deactivate_object(option_object1);
				instance_deactivate_object(option_object2);
				instance_deactivate_object(option_object3);
			}
		}
	}else{
		if instance_exists(textbox) {
			with(textbox) {
				textbox_visible = true;
				instance_activate_object(option_object1);
				instance_activate_object(option_object2);
				instance_activate_object(option_object3);
			}
		}
	}
}

/*/Example:
if textbox_exists() {
	if keyboard_check_pressed(vk_escape) {
		if textbox_is_visible() {
			textbox_hide(true);
		}else{
			textbox_hide(false);
		}
	}
}
This code hides or shows the textbox when pressing esc.