///@description textbox_set_speed
///@arg speed1
///@arg [speed2
///@arg speed3
///@arg etc.]
///Sets how fast the text increases in each message. Default is 0.5.
///You set the messages with textbox_create().
function textbox_set_speed() {

	with(textbox) {
		//Set the speed for all the provided arguments
		var maxmessages = array_length(message);
		for (var i = 0; i < maxmessages; i ++;) {
			if argument_count > i {
				message_speed[i] = argument[i];
			}else{
				message_speed[i] = 0.5;
			}
		}
		//Speed is set
		speed_set = true;
	}

}

//Example:
//textbox_set_speed(0.5,0.5,1,0.2,0.5);
//This sets the speed for 5 messages.