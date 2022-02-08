/// @description Monitors everything important every frame

isTextboxCreated = textbox_exists();

// The player should not move when a textbox exists.

if instance_exists(player) {
	movState = player.disableMovement;
	comState = player.disableCombat;
	
	if isTextboxCreated {
		player.disableMovement = true;
		player.disableCombat = true;
	} else {
		player.disableMovement = movState;
		player.disableCombat = comState;
	}
	
	if not isTextboxCreated and keyboard_check_pressed(ord("E")) {
		textbox_create("Hello?","Is there anyone here?", "The world is awfully quiet...");
        textbox_set("Alexis",c_blue,c_white,c_white,0.7,fnt_ConsolasDisplay,noone,true);
		textbox_set_key(ord("E"));
		// textbox_set_position(x - 100, y - 100, x + 100, y - 50, x - 110, y - 130, x - 60, y - 105, 0, 0, x - 85, y - 95, x - 85, y - 125);
    }
}