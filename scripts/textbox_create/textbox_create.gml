///@description textbox_create
///@arg message1
///@arg [message2
///@arg message3
///@arg message4
///@arg message5
///@arg etc.]
//Creates the textbox and initializes the variables needed
//You just need to set the messages in the arguments
function textbox_create() {

	//Create the textbox (You might need to change the layer to suit your project. But make sure it's above everything.)
	instance_create_layer(x,y,"hud",textbox);

	with(textbox) {


		///Messages
		//If you use options, this is the first option path. Other option paths are in the step event.
		var maxmessages = argument_count;
		for (var i = 0; i < maxmessages; i ++;) {
		   if argument_count > i {
			   message[i] = argument[i];
		   }
		}

		//Current message
		message_current = 0;
		//Last message
		message_end = argument_count-1;
		//How fast the characters appear
		increase = 0.5;
		//How much characters are shown
		characters = 0;
		//What has to be drawn currently
		message_draw = "";
		//Current message length
		message_length = string_length(message[message_current]);

		//Set additional variables
		name = noone;
		general_colour = c_black;
		text_colour = c_white;
		outline_colour = c_white;
		alpha = 1;
		font = noone;
		sprite = noone;
		separation = 25;
		bubble_width = 300;
		object_talking = noone;
		mouse_enabled = false;
		continue_icon = noone;

		//Keys
		speak_key = vk_space;
		skip_key = vk_space;

		///Options
		//Variable to know if options has been set
		options_set = false;
		//options_set2 = false;
		//options_set3 = false;
		//Variable to know if options has to be shown
		options_show = false;
		//options_show2 = false;
		//options_show3 = false;
		//Option variable - Takes track of the selected option
		selected = "option1";
		//Variable to check how many options there are
		optioncount = 0;
		//optioncount2 = 0;
		//optioncount3 = 0;

		//Set additional option variables
		s_text_colour = c_black;
		show_options_when = 0;
		option1 = noone;
		option2 = noone;
		option3 = noone;
		message_to_change = 0;
		//message_to_change2 = 0;
		//message_to_change3 = 0;
		ifoption1 = "";
		ifoption2 = "";
		ifoption3 = "";
		/*ifoptionsecond1 = "";
		ifoptionsecond2 = "";
		ifoptionsecond3 = "";
		ifoptionthird1 = "";
		ifoptionthird2 = "";
		ifoptionthird3 = "";*/
		option_outside_view = false;

		///Speed of text
		//Variable to know if speed has been set
		speed_set = false;

		//Text sound
		//if should make sound
		text_sound = false;
		text_sound_volume = 1;
		text_sound_interval = 5;
		//what sound
		textsound = noone;

		//Textbox sprite
		textbox_sprite_set = false;
		textbox_sprite = noone;
		textbox_sprite2 = noone;


		//Positions
		position_set = false;
		x1 = 0;
		x2 = 0;
		y1 = 0;
		y2 = 0;
		namex1 = 0;
		namex2 = 0;
		namey1 = 0;
		namey2 = 0;
		sprite_position_set = false;
		spritex = 0;
		spritey = 0;
		text_position_set = false;
		textx = 0;
		texty = 0;
		name_text_position_set = false;
		nametextx = 0;
		nametexty = 0;
	
		//Textbox visibility
		textbox_visible = true;

		//Change variable at the end variables
		var_object = noone;
		var_to_change = noone;
		var_value = noone;
	
		//Backlog
		backlog_visible = false;
		texts_in_backlog = 0;
		backlog_position = 0;
		backlog_stop_down = false;
		backlog_stop_up = false;
		scroll_speed = 30;
		for (var i = 0; i < maxmessages; i ++;) {
		   if argument_count > i {
			   backlog[i] = "";
		   }
		}
		backlog[0] = message[0];

		//Mode
		mode = "box";
	
	}

}


//Example:
//textbox_create("Hi","My name is Bob.","How are you?");
