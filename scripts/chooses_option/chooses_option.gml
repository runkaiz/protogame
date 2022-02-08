///@description chooses_option()
function chooses_option() {
	//Returns the option the player choosed in a dialogue (1, 2 or 3)

	with(textbox) {
		if keyboard_check_pressed(speak_key) {
			if message_current = show_options_when {
				if characters = message_length {
					if selected = "option1" {
						return 1;
					}else if selected = "option2" {
						return 2;
					}else if selected = "option3" {
						return 3;
					}
				}
			}
		}
	}

	/*Example:
	if chooses_option() = 2 {
		with(player) {
			got_sword = true;
		}
	}*/
}
